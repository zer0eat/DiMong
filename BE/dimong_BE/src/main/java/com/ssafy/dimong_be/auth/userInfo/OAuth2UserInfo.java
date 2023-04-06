package com.ssafy.dimong_be.auth.userInfo;

import java.util.Map;

import com.ssafy.dimong_be.domain.model.user.ProviderType;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.domain.model.user.UserRole;

public abstract class OAuth2UserInfo {

	// public static final String BUNDLER_EMAIL_DOMAIN = "@bundler.com";

	protected Map<String, Object> attributes;

	public OAuth2UserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public abstract String getId();

	public abstract String getName();

	public abstract String getEmail();

	public abstract String getImageUrl();

	// public ProviderType providerType;

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

	public static User toEntity(OAuth2UserInfo oAuth2UserInfo, ProviderType providerType) {
		return User.builder()
			.userNickname(oAuth2UserInfo.getName())
			.userProfileImage(oAuth2UserInfo.getImageUrl())
			.providerId(oAuth2UserInfo.getId())
			.providerType(providerType)
			.userRole(UserRole.USER) //무조건 user
			.build();
	}
	
}
