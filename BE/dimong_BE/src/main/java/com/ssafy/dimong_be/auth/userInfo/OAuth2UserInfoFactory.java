package com.ssafy.dimong_be.auth.userInfo;

import java.util.Map;

import com.ssafy.dimong_be.domain.model.user.ProviderType;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class OAuth2UserInfoFactory {
	public static OAuth2UserInfo getOAuth2UserInfo(ProviderType providerType, Map<String, Object> attributes) {
		switch (providerType) {
			case GOOGLE:
				return new CumtomOAuth2UserInfo(attributes);
			// case FACEBOOK:
			// 	return new FacebookOAuth2UserInfo(attributes);
			// case NAVER:
			// 	return new NaverOAuth2UserInfo(attributes);
			// case GITHUB:
			// 	return new GithubOAuth2UserInfo(attributes);

			default:
				throw new IllegalArgumentException("Invalid Provider Type.");
		}
	}
}
