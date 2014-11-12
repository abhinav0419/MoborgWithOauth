package com.mob.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mob.model.LocationLogs;
import com.mob.model.OfficeAddress;
import com.mob.model.User;
import com.mob.service.LocationLogsService;
import com.mob.service.UserService;

@Controller
public class MapController {

	/*
	 * The viewMomMap Method Redirects to MobMap page.
	 * 
	 * @author Mobiquityinc
	 * 
	 * @since 28-sept-2014
	 */

	@Autowired
	private LocationLogsService locationLogService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/mobmap", method = RequestMethod.GET)
	public ModelAndView viewMobMap(Map<String, Object> model,
			HttpSession session, HttpServletRequest request) {

		String userEmail = (String) session.getAttribute("email");
		/*System.out.println(session.getAttribute("email"));*/
		User user = new User();
		OfficeAddress address = new OfficeAddress();
		ModelAndView modelAndView = new ModelAndView("mobmap");
		if (session.getAttribute("lat") == null
				&& session.getAttribute("lng") == null) {

			user.setEmailId(userEmail);
			model.put("userEntity", userService.loadLocation(user));

		} else {
			Long lat = (Long) session.getAttribute("longLat");
			Long lng = (Long) session.getAttribute("longLng");
			address.setLatitude(lat);
			address.setLongitude(lng);
			user.setOfficeLocationId(address);
			model.put("userEntity", user);
		}
		User userEntity = userService.getUserByEmailId(userEmail);
		session.setAttribute("loggedUser", userEntity);
		session.setAttribute("loggedUserId", userEntity.getUserId());
		session.setAttribute("loggedUserName", userEntity.getFullName());
		model.put("userEntity", userService.loadLocation(user));
		return modelAndView;
	}

	@RequestMapping(value = "/persistuserlocation", method = RequestMethod.POST)
	public void saveUserLocation(@RequestParam("latitude") String latitude,
			@RequestParam("longitude") String longitude,
			@RequestParam("usercity") String city,
			@RequestParam("userregion") String state,
			@RequestParam("usercountry") String country,
			HttpServletResponse response, HttpSession session) {

		User userId = new User();
		/*System.out.println((Long) session.getAttribute("loggedUserId"));*/
		userId.setUserId((Long) session.getAttribute("loggedUserId"));

		User userAlreadyExists = userService.getUserById(userId.getUserId());
		/*System.out.println(userAlreadyExists.getFullName());
		System.out.println(userAlreadyExists.getLatitude());
*/
		LocationLogs locationLogs = new LocationLogs();
		locationLogs.setLatitude(Double.parseDouble(latitude));
		locationLogs.setLongitude(Double.parseDouble(longitude));
		locationLogs.setCity(city);
		locationLogs.setCountry(country);
		locationLogs.setCurrentDate(new Date());
		locationLogs.setIpAddress("NA");
		locationLogs.setState(state);
		locationLogs.setUserId(userId);

		userAlreadyExists.setLatitude(Double.parseDouble(latitude));
		userAlreadyExists.setLongitude(Double.parseDouble(longitude));
		userService.saveUser(userAlreadyExists);

		/*System.out.println(latitude + longitude + city + state + country
				+ locationLogs.getUserId());
		*/
		userService.updateLocation(locationLogs.getLatitude(),locationLogs.getLongitude(),userId);
		locationLogService.saveUserLocation(locationLogs);

		response.setStatus(200);
		session.removeAttribute("flag");
	}

	@RequestMapping(value = "/fetchUserLatLong", method = RequestMethod.GET)
	public String fetchUserLatLong(@RequestParam("userName") String userName,
			@RequestParam("userId") long userId, HttpServletRequest request,
			Map<String, Object> model) {

		User user = userService.getUserById(userId);
		/*System.out.println("!");*/
		// user = userService.loadLocation(user);

	/*	System.out.println(user.getFullName());*/
		/*System.out.println(user.getLatitude());*/
		model.put("userEntity1", user);

		/*System.out.println("///////////////////////////////////userEntity1"
				+ user.getLatitude());*/
		return "mobmap";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadmarker", method = RequestMethod.GET)
	public void userJSONList(HttpServletResponse response) {

		List<User> userList = userService.getListOfUser();
		JSONObject jObject = new JSONObject();
		try {
			JSONArray jArray = new JSONArray();

			for (User user : userList) {
				JSONObject userJSON = new JSONObject();
				userJSON.put("user_id", user.getUserId());
				userJSON.put("user_name", user.getFullName());
				userJSON.put("latitude", user.getOfficeLocationId()
						.getLatitude());
				userJSON.put("longitude", user.getOfficeLocationId()
						.getLongitude());
				jArray.add(userJSON);
			}
			jObject.put("StudentList", jArray);
			response.setContentType("text/json");
			response.getWriter().write(jObject.toString());

			/*System.out.println(jObject);*/
		} catch (Exception jse) {
			jse.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getuserprofilemap", method = RequestMethod.GET)
	public ModelAndView getUserProfile(@RequestParam("userId") Long userId,
			@RequestParam("map") String map, @RequestParam("lat") String lat,
			@RequestParam("lng") String lng,
			@RequestParam("nelat") String nelat,
			@RequestParam("swlng") String swlng,
			@RequestParam("swlat") String swlat,
			@RequestParam("nelng") String nelng, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		Double longLat = Double.parseDouble(lng);
		Double longLng = Double.parseDouble(lat);
		Double nelatDouble = Double.parseDouble(nelat);
		Double swlngDouble = Double.parseDouble(swlng);
		Double swlatDouble = Double.parseDouble(swlat);
		Double nelngDouble = Double.parseDouble(nelng);
		/*System.out.println("north east latitude " + nelatDouble);
		System.out.println("south west longitude " + swlngDouble);
		System.out.println("south west latitude " + swlatDouble);
		System.out.println("north east longitude " + nelngDouble);
*/
		session.setAttribute("longLat", longLat);
		session.setAttribute("longLng", longLng);

		ModelAndView modelAndView = new ModelAndView("userprofile");
		if (map.equalsIgnoreCase("true")) {

			User user = userService.getUserById(userId);

			if (user.getUserPicture() == null) {
				user.setUserPicture("resource/img/mob.png");
			}
			request.setAttribute("mapGoBack", true);
			modelAndView.addObject("user", user);
		}

		List<User> userInCurrentBound = userService.getUserInCurrentBounds(
				nelatDouble, swlngDouble, swlatDouble, nelngDouble);
		// List<User> userInCurrentBound = userService.getHardCodedUsers();
		/*System.out.println("printing in range users");*/
		JSONObject jObject = new JSONObject();
		try {
			JSONArray jArray = new JSONArray();

			for (User user : userInCurrentBound) {
				JSONObject userJSON = new JSONObject();
				userJSON.put("user_id", user.getUserId());
				userJSON.put("user_name", user.getFullName());
				userJSON.put("latitude", user.getOfficeLocationId()
						.getLatitude());
				userJSON.put("longitude", user.getOfficeLocationId()
						.getLongitude());
				jArray.add(userJSON);
			}
			jObject.put("StudentList", jArray);
			response.setContentType("text/json");
			response.getWriter().write(jObject.toString());

			/*System.out.println(jObject);*/
		} catch (Exception jse) {
			jse.printStackTrace();
		}
		// modelAndView.addObject("jsonUserList", jObject);
		return modelAndView;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadUsersInBound", method = RequestMethod.GET)
	public void loadUsersInBound(
			// @RequestParam("userId") Long userId,
			// @RequestParam("map") String map,
			@RequestParam("lat") String lat, @RequestParam("lng") String lng,
			@RequestParam("nelat") String nelat,
			@RequestParam("swlng") String swlng,
			@RequestParam("swlat") String swlat,
			@RequestParam("nelng") String nelng, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		Double longLat = Double.parseDouble(lng);
		Double longLng = Double.parseDouble(lat);
		Double nelatDouble = Double.parseDouble(nelat);
		Double swlngDouble = Double.parseDouble(swlng);
		Double swlatDouble = Double.parseDouble(swlat);
		Double nelngDouble = Double.parseDouble(nelng);
		/*System.out.println("north east latitude " + nelatDouble);
		System.out.println("south west longitude " + swlngDouble);
		System.out.println("south west latitude " + swlatDouble);
		System.out.println("north east longitude " + nelngDouble);*/

		session.setAttribute("longLat", longLat);
		session.setAttribute("longLng", longLng);

		// ModelAndView modelAndView = new ModelAndView("userprofile");
		// if (map.equalsIgnoreCase("true")) {
		//
		// request.setAttribute("mapGoBack", true);
		// }

		List<User> userInCurrentBound = userService.getUserInCurrentBounds(
				nelatDouble, swlngDouble, swlatDouble, nelngDouble);
		// List<User> userInCurrentBound = userService.getHardCodedUsers();
		/*System.out.println("printing in range users");*/
		JSONObject jObject = new JSONObject();
		try {
			JSONArray jArray = new JSONArray();

			for (User user : userInCurrentBound) {
				JSONObject userJSON = new JSONObject();
				userJSON.put("user_id", user.getUserId());
				userJSON.put("user_name", user.getFullName());
				userJSON.put("latitude", user.getLatitude());
				userJSON.put("longitude", user.getLongitude());
				jArray.add(userJSON);
			}
			jObject.put("UserList", jArray);
			response.setContentType("text/json");
			response.getWriter().write(jObject.toString());

			/*System.out.println(jObject);*/
		} catch (Exception jse) {
			jse.printStackTrace();
		}
	}

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String viewMobMapwithmenu() {
		return "mobmap";

	}
}
