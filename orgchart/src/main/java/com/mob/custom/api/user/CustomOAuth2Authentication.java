/*package com.mob.custom.api.user;

import java.util.Collection;
import java.util.Set;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import com.google.common.collect.Sets;

public class CustomOAuth2Authentication extends AbstractAuthenticationToken {
    private static final long serialVersionUID = 7527734076633525176L;

    private final OAuth2Request storedRequest;
    private final Authentication userAuthentication;

    public CustomOAuth2Authentication(OAuth2Authentication authentication) {
        super(authentication.isClientOnly() ? authentication.getAuthorities() : filter(authentication.getAuthorities(), authentication.getOAuth2Request().getScope()));
        this.storedRequest = authentication.getOAuth2Request();
        this.userAuthentication = authentication.getUserAuthentication();
        setDetails(authentication.getDetails());
        setAuthenticated(authentication.isAuthenticated());
    }

    *//**
     * Retains only the authorities from the set of approved scopes.
     *//*
    private static Collection<GrantedAuthority> filter(Collection<? extends GrantedAuthority> authorities, Set<String> scope) {
        Collection<GrantedAuthority> result = Sets.newHashSet();
        for (GrantedAuthority authority : authorities) {
            if (scope.contains(authority.getAuthority())) {
                result.add(authority);
            }
        }
        return result;
    }

	@Override
	public Object getCredentials() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getPrincipal() {
		// TODO Auto-generated method stub
		return null;
	}
}
*/