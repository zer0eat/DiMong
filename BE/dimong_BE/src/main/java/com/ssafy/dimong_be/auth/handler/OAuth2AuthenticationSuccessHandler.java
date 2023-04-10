// package com.ssafy.dimong_be.auth.handler;
//
// import static com.ssafy.dimong_be.auth.repository.OAuth2AuthorizationRequestBasedOnCookieRepository.*;
//
// import java.io.IOException;
// import java.net.URI;
// import java.util.Collection;
// import java.util.Date;
// import java.util.Optional;
//
// import org.springframework.security.core.Authentication;
// import org.springframework.security.core.GrantedAuthority;
// import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
// import org.springframework.security.oauth2.core.oidc.user.OidcUser;
// import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
// import org.springframework.stereotype.Component;
// import org.springframework.web.util.UriComponentsBuilder;
//
// import com.ssafy.dimong_be.application.exception.business.UserNotFoundException;
// import com.ssafy.dimong_be.auth.jwt.AuthToken;
// import com.ssafy.dimong_be.auth.jwt.AuthTokenProvider;
// import com.ssafy.dimong_be.auth.properties.AppProperties;
// import com.ssafy.dimong_be.auth.repository.OAuth2AuthorizationRequestBasedOnCookieRepository;
// import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfo;
// import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfoFactory;
// import com.ssafy.dimong_be.auth.util.CookieUtil;
// import com.ssafy.dimong_be.domain.model.user.ProviderType;
// import com.ssafy.dimong_be.domain.model.user.User;
// import com.ssafy.dimong_be.domain.model.user.UserRefreshToken;
// import com.ssafy.dimong_be.domain.model.user.UserRepository;
// import com.ssafy.dimong_be.domain.model.user.UserRole;
//
// import jakarta.servlet.ServletException;
// import jakarta.servlet.http.Cookie;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import lombok.Builder;
// import lombok.RequiredArgsConstructor;
// import lombok.extern.slf4j.Slf4j;
//
// @Component
// @RequiredArgsConstructor
// @Builder
// @Slf4j
// public class OAuth2AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
//
// 	private final AuthTokenProvider tokenProvider;
// 	// private final JwtTokenProvider jwtTokenProvider;
// 	private final AppProperties appProperties;
// 	// private final UserRefreshTokenRepository userRefreshTokenRepository;
// 	private final UserRepository userRepository;
// 	private final OAuth2AuthorizationRequestBasedOnCookieRepository authorizationRequestRepository;
//
// 	@Override
// 	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
// 		Authentication authentication) throws IOException, ServletException {
// 		String targetUrl = determineTargetUrl(request, response, authentication);
// 		// String targetUrl = "http://127.0.0.1/3000";
// 		// String targetUrl = "http://127.0.0.1:5500/success.html";
//
// 		///////////////
//
// 		log.info("onAuthenticationSuccess() !!!");
// 		///////////////
//
// 		if (response.isCommitted()) {
// 			logger.info("Response has already been committed. Unable to redirect to " + targetUrl);
// 			return;
// 		}
//
// 		clearAuthenticationAttributes(request, response);
// 		getRedirectStrategy().sendRedirect(request, response, targetUrl);
// 	}
//
// 	protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response,
// 		Authentication authentication) {
// 		Optional<String> redirectUri = CookieUtil.getCookie(request, REDIRECT_URI_PARAM_COOKIE_NAME)
// 			.map(Cookie::getValue);
//
// 		if (redirectUri.isPresent() && !isAuthorizedRedirectUri(redirectUri.get())) {
// 			throw new IllegalArgumentException(
// 				"Sorry! We've got an Unauthorized Redirect URI and can't proceed with the authentication");
// 		}
//
// 		String targetUrl = redirectUri.orElse(getDefaultTargetUrl());
//
// 		OAuth2AuthenticationToken authToken = (OAuth2AuthenticationToken)authentication;
// 		ProviderType providerType = ProviderType.valueOf(authToken.getAuthorizedClientRegistrationId().toUpperCase());
//
// 		// log.info("authToken: " + authToken.getPrincipal().);
//
// 		OidcUser user = ((OidcUser)authentication.getPrincipal());
// 		OAuth2UserInfo userInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(providerType, user.getAttributes());
// 		Collection<? extends GrantedAuthority> authorities = ((OidcUser)authentication.getPrincipal()).getAuthorities();
//
// 		UserRole userRole = hasAuthority(authorities, UserRole.ADMIN.getCode()) ? UserRole.ADMIN : UserRole.USER;
//
// 		User u = userRepository.findByProviderTypeAndProviderId(providerType, userInfo.getId()).orElseThrow();
//
// 		Date now = new Date();
// 		AuthToken accessToken = tokenProvider.createAuthToken(
// 			//			userInfo.getId(),
// 			String.valueOf(u.getUserId()),
// 			userRole.getCode(),
// 			new Date(now.getTime() + appProperties.getAuth().getTokenExpiry())
// 		);
//
// 		// refresh 토큰 설정
// 		long refreshTokenExpiry = appProperties.getAuth().getRefreshTokenExpiry();
//
// 		AuthToken refreshToken = tokenProvider.createAuthToken(
// 			//			appProperties.getAuth().getTokenSecret(),
// 			String.valueOf(u.getUserId()),
// 			new Date(now.getTime() + refreshTokenExpiry)
// 		);
//
// 		// DB 저장
// 		Optional<UserRefreshToken> userRefreshTokenOptional =
// 			userRefreshTokenRepository.findByUser_ProviderTypeAndUser_ProviderId(
// 				providerType, userInfo.getId());
//
// 		if (userRefreshTokenOptional.isPresent()) {
// 			UserRefreshToken userRefreshToken = userRefreshTokenOptional.get();
// 			userRefreshToken.setRefreshToken(refreshToken.getToken());
// 			userRefreshTokenRepository.saveAndFlush(userRefreshToken);
// 		} else {
// 			User user1 = userRepository.findOneByProviderTypeAndProviderId(providerType, userInfo.getId()).orElseThrow(
// 				() -> new UserNotFoundException(
// 					"해당 (providerType, providerId) = " + providerType + ", " + userInfo.getId() + " 를 가지는 사용자 없음"));
//
// 			userRefreshTokenRepository.saveAndFlush(
// 				UserRefreshToken.builder()
// 					.userId(user1.getUserId())
// 					.refreshToken(refreshToken.getToken())
// 					.build()
// 			);
// 		}
//
// 		int cookieMaxAge = (int)refreshTokenExpiry / 60;
//
// 		CookieUtil.deleteCookie(request, response, REFRESH_TOKEN);
// 		CookieUtil.addCookie(response, REFRESH_TOKEN, refreshToken.getToken(), cookieMaxAge);
//
// 		return UriComponentsBuilder.fromUriString(targetUrl)
// 			.queryParam("accessToken", accessToken.getToken())
// 			.build().toUriString();
// 	}
//
// 	protected void clearAuthenticationAttributes(HttpServletRequest request, HttpServletResponse response) {
// 		super.clearAuthenticationAttributes(request);
// 		authorizationRequestRepository.removeAuthorizationRequestCookies(request, response);
// 	}
//
// 	private boolean hasAuthority(Collection<? extends GrantedAuthority> authorities, String authority) {
// 		if (authorities == null) {
// 			return false;
// 		}
//
// 		for (GrantedAuthority grantedAuthority : authorities) {
// 			if (authority.equals(grantedAuthority.getAuthority())) {
// 				return true;
// 			}
// 		}
// 		return false;
// 	}
//
// 	private boolean isAuthorizedRedirectUri(String uri) {
// 		URI clientRedirectUri = URI.create(uri);
//
// 		return appProperties.getOauth2().getAuthorizedRedirectUris()
// 			.stream()
// 			.anyMatch(authorizedRedirectUri -> {
// 				// Only validate host and port. Let the clients use different paths if they want to
// 				URI authorizedURI = URI.create(authorizedRedirectUri);
// 				if (authorizedURI.getHost().equalsIgnoreCase(clientRedirectUri.getHost())
// 					&& authorizedURI.getPort() == clientRedirectUri.getPort()) {
// 					log.trace("OAuth2AuthenticationSuccessHandler - isAuthorizedRedirectUri 성공");
// 					return true;
// 				}
// 				log.trace("OAuth2AuthenticationSuccessHandler - isAuthorizedRedirectUri 실패");
// 				return false;
// 			});
// 	}
// }
