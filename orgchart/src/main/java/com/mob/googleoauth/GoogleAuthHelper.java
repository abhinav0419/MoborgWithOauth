package com.mob.googleoauth;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.api.client.auth.oauth2.AuthorizationCodeRequestUrl;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponseException;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;

public final class GoogleAuthHelper {

	private static final String CLIENT_ID = "151623693832-8e3m97fbljfeqk3l8cllrer7lv3qas4m.apps.googleusercontent.com";
	private static final String CLIENT_SECRET = "15urGxt1WfZEy8Z8eGywTJd-";
	/**
	 * Callback URI that google will redirect to after successful authentication
	 */
	private static final String CALLBACK_URI = "http://localhost:8080/orgchart/oauthRedirect?client_name=Google2Client";
	// private static final String HD = "mobiquityinc.com";

	// start google authentication constants
	private static final Iterable<String> SCOPE = Arrays
			.asList("https://www.googleapis.com/auth/userinfo.profile;https://www.googleapis.com/auth/userinfo.email"
					.split(";"));
	private static final String USER_INFO_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
	private static final JsonFactory JSON_FACTORY = new JacksonFactory();
	private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
	// end google authentication constants

	private String stateToken;

	private final GoogleAuthorizationCodeFlow flow;

	/**
	 * Constructor initializes the Google Authorization Code Flow with CLIENT
	 * ID, SECRET, and SCOPE
	 */
	public GoogleAuthHelper() {

		System.out.println("google auth helper called");
		flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT,
				JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, SCOPE).build();
		flow.newAuthorizationUrl().setApprovalPrompt("force").setAccessType("offline");
//		AuthorizationCodeRequestUrl authorizationUrl = flow
//				.newAuthorizationUrl().setRedirectUri(CALLBACK_URI)
//				.setApprovalPrompt("force").setAccessType("offline");
		generateStateToken();
	}

	/**
	 * Builds a login URL based on client ID, secret, callback URI, and scope
	 */
	public String buildLoginUrl() {
		System.out.println("building uri called");
		final GoogleAuthorizationCodeRequestUrl url = flow
				.newAuthorizationUrl();

		return url.setRedirectUri(CALLBACK_URI).setState(stateToken).build();
	}

	/**
	 * Generates a secure state token
	 */
	private void generateStateToken() {
		System.out.println("generated token called");
		SecureRandom sr1 = new SecureRandom();
		// System.out.println(sr1);
		stateToken = "google;" + sr1.nextInt();

	}

	/**
	 * Accessor for state token
	 */
	public String getStateToken() {
		System.out.println("gettoken called");
		return stateToken;
	}

	/**
	 * Expects an Authentication Code, and makes an authenticated request for
	 * the user's profile information
	 * 
	 * @return JSON formatted user profile information
	 * @param authCode
	 *            authentication code provided by google
	 * @throws JSONException
	 */
	@SuppressWarnings("unchecked")
	public List getUserInfoJson(final String authCode,HttpSession session) throws IOException,
			JSONException {
		List ls = new ArrayList();		
		try{
		System.out.println("getuserinfojson called"+authCode+CALLBACK_URI);
		final GoogleTokenResponse response = flow.newTokenRequest(authCode).setRedirectUri(CALLBACK_URI).execute();
	
		session.setAttribute("userToken", response.getAccessToken());
		final Credential credential = flow.createAndStoreCredential(response,
				null);
		final HttpRequestFactory requestFactory = HTTP_TRANSPORT
				.createRequestFactory(credential);
		// Make an authenticated request
		final GenericUrl url = new GenericUrl(USER_INFO_URL);
		final HttpRequest request = requestFactory.buildGetRequest(url);
		request.getHeaders().setContentType("application/json");
		final String jsonIdentity = request.execute().parseAsString();
		// System.out.println(jsonIdentity);
		JSONObject object = new JSONObject(jsonIdentity);

		String email = object.getString("email");
		String name = object.getString("name");
		String picture = object.getString("picture");

		
		ls.add(email);
		ls.add(name);
		ls.add(picture);
		}
		catch(NullPointerException e)
		{
			throw e;
		}
		catch (TokenResponseException e) {
			throw e;
		}
		return ls;

	}

}
