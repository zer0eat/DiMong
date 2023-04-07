package com.ssafy.dimong_be.auth.userInfo;

import java.util.Map;

public class CumtomOAuth2UserInfo extends OAuth2UserInfo {

	public CumtomOAuth2UserInfo(Map<String, Object> attributes) {
		super(attributes);
	}

	@Override
	public String getId() {
		return (String) attributes.get("providerId");
	}

	@Override
	public String getName() {
		return (String) attributes.get("userNickname");
	}

	@Override
	public String getEmail() {
		return (String) attributes.get("userEmail");
	}

	@Override
	public String getImageUrl() {
		return (String) attributes.get("userProfileImage");
	}

}
