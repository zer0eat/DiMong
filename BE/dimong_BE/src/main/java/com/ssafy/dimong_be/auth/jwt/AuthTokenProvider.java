package com.ssafy.dimong_be.auth.jwt;

import java.security.Key;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Collectors;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.ssafy.dimong_be.auth.exception.TokenValidFailedException;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthTokenProvider {
	// implements AuthenticationProvider

	private final Key key;
	private static final String AUTHORITIES_KEY = "role";

	public AuthTokenProvider(String secret) {
		this.key = Keys.hmacShaKeyFor(secret.getBytes());
	}

	public AuthToken createAuthToken(String id, Date expiry) {
		return new AuthToken(id, expiry, key);
	}

	public AuthToken createAuthToken(String id, String role, Date expiry) {
		return new AuthToken(id, role, expiry, key);
	}

	public AuthToken convertAuthToken(String token) {
		return new AuthToken(token, key);
	}

	public Authentication getAuthentication(AuthToken authToken) {
		if (authToken.validate()) {
			Claims claims = authToken.getTokenClaims();
			Collection<? extends GrantedAuthority> authorities =
				Arrays.stream(new String[] {claims.get(AUTHORITIES_KEY).toString()})
					.map(SimpleGrantedAuthority::new)
					.collect(Collectors.toList());

			log.debug("claims subject := [{}]", claims.getSubject());
			User principal = new User(claims.getSubject(), "", authorities);

//			UserPrincipal userPrincipal = UserPrincipal.builder()
//					.userId()
			UsernamePasswordAuthenticationToken test =
					new UsernamePasswordAuthenticationToken(principal, authToken, authorities);
			System.out.println(test.getPrincipal().toString());
			return test;
		} else {
			throw new TokenValidFailedException();
		}
	}

	// @Override
	// public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	// 	return null;
	// }
	//
	// @Override
	// public boolean supports(Class<?> authentication) {
	// 	return false;
	// }

	// @Override
	// public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	// 	try {
	// 		// 로그인 인증 전
	// 		UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken) authentication;
	// 		String principal = (String) authenticationToken.getPrincipal();
	// 		String credential = (String) authenticationToken.getCredentials();
	// 		AuthResponseDto authResponseDto = userService.login(new AuthRequestDto(principal, credential));
	// 		// 로그인 인증 후
	// 		UsernamePasswordAuthenticationToken authenticated
	// 				= new UsernamePasswordAuthenticationToken(authResponseDto.getUser().getId(), null, AuthorityUtils.createAuthorityList("ROLE_USER"));
	// 		authenticated.setDetails(authResponseDto);
	// 		return authenticated;
	// 	} catch(DoNotExistException e) {
	// 		throw new UsernameNotFoundException(e.getMessage());
	// 	} catch(IllegalArgumentException e) {
	// 		throw new BadCredentialsException(e.getMessage());
	// 	} catch(DataAccessException e) {
	// 		throw new AuthenticationServiceException(e.getMessage());
	// 	}
	// }
	//
	// @Override
	// public boolean supports(Class<?> authentication) {
	// 	return ClassUtils.isAssignable(JwtAuthenticationToken.class, authentication);
	// }
}
