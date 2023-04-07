package com.ssafy.dimong_be.interfaces.user;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfo;
import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfoFactory;
import com.ssafy.dimong_be.domain.model.user.ProviderType;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
// @Setter
@RequiredArgsConstructor
public class SignupRequestDto implements Serializable {

	private String providerId;
	private String userNickname;
	private String userEmail;
	private String userProfileImage;
	private ProviderType providerType;

	public static ProviderType getProviderType(String providerType) {
		switch (providerType.toUpperCase()) {
			case "GOOGLE":
				return ProviderType.GOOGLE;
			// case "FACEBOOK":
			// 	this.providerType = ProviderType.FACEBOOK;
			// case "NAVER":
			// 	this.providerType = ProviderType.NAVER;
			// case "GITHUB":
			// 	this.providerType = ProviderType.GITHUB;
		}

		return null;
	}

	public OAuth2UserInfo toOAuth2UserInfo(String providerType) {
		Map<String, Object> attributes = new HashMap<>();

		attributes.put("providerId", this.providerId);
		attributes.put("userNickname", this.userNickname);
		attributes.put("userEmail", this.userEmail);
		attributes.put("userProfileImage", this.userProfileImage);

		return OAuth2UserInfoFactory.getOAuth2UserInfo(this.getProviderType(providerType), attributes);
	}

}
