/*package com.mob.custom.api.user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import com.mob.service.UserService;
public class GoogleAccountsAuthenticationEntryPoint implements AuthenticationEntryPoint {
  public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException)
      throws IOException, ServletException {
    UserService userService = UserServiceFactory.getUserService();

    response.sendRedirect(userService.createLoginURL(request.getRequestURI()));
  }
}*/