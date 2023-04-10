package com.ssafy.dimong_be.auth.service;

import java.io.IOException;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {
	@Override
	public void commence(
		HttpServletRequest request,
		HttpServletResponse response,
		AuthenticationException authException
	) throws IOException, ServletException {
		authException.printStackTrace();
		log.info("Responding with unauthorized error. Message := {}", authException.getMessage());
		response.sendError(
			HttpServletResponse.SC_UNAUTHORIZED,
			authException.getLocalizedMessage()
		);
	}
}
