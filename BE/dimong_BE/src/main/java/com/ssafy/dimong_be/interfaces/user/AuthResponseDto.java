package com.ssafy.dimong_be.interfaces.user;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.user.User;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AuthResponseDto implements Serializable {

	private Long userId;
	private String accessToken;

	public static AuthResponseDto fromEntity(User user, String token) {
		return AuthResponseDto.builder()
			.userId(user.getUserId())
			.accessToken(token)
			.build();
	}

}
