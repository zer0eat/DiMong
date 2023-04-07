package com.ssafy.dimong_be.interfaces.user;

import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dimong_be.application.UserService;
import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfo;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
public class UserController {

	private final UserService userService;

	@PostMapping("/v1/signup/{providerType}")
	public ResponseEntity<AuthResponseDto> signup(@PathVariable String providerType, @RequestBody SignupRequestDto signupRequestDto) {
		return ResponseEntity.ok(userService.signup(signupRequestDto.toOAuth2UserInfo(providerType), OAuth2UserInfo.getProviderType(providerType)));
	}

	@PostMapping("/v1/login")
	public ResponseEntity<AuthResponseDto> login(@RequestBody OAuthProviderDto oAuthProviderDto) {
		return ResponseEntity.ok(userService.login(oAuthProviderDto));
	}

	@PostMapping("/v2/login")
	public ResponseEntity<AuthResponseDto> login(@RequestBody SignupRequestDto signupRequestDto) {
		return ResponseEntity.ok(userService.login(
			signupRequestDto.toOAuth2UserInfo(
				signupRequestDto.getProviderType().name()),
				signupRequestDto.getProviderType()
			)
		);
	}

}
