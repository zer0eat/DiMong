package com.ssafy.dimong_be.auth.handler;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.auth.service.AuthService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Transactional
@RequiredArgsConstructor
@Slf4j
public class CustomLogoutHandler implements LogoutHandler {

	private final AuthService authService;

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		// log.info("request header의 Authorization: " + request.getHeader("Authorization"));
		// authService.logout(HeaderUtil.getAccessToken(request));
		//
		// Cookie refreshToken = new Cookie("refreshToken", null);
		// refreshToken.setValue("");
		// refreshToken.setPath("/");
		// refreshToken.setMaxAge(0);
		// refreshToken.setDomain("i8a810.p.ssafy.io");
		// response.addCookie(refreshToken);
	}

}
