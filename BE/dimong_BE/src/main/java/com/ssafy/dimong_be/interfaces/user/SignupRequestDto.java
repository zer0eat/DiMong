package com.ssafy.dimong_be.interfaces.user;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfo;
import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfoFactory;
import com.ssafy.dimong_be.domain.model.user.ProviderType;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
// @Setter
@RequiredArgsConstructor
public class SignupRequestDto implements Serializable {

	private String providerId;
	private String userNickname;
	private String userEmail;
	private String userProfileImage;
	private ProviderType providerType;

	public void setProviderType(String providerType) {
		this.providerType = OAuth2UserInfo.getProviderType(providerType);
	}

	public OAuth2UserInfo toOAuth2UserInfo(String providerType) {
		Map<String, Object> attributes = new HashMap<>();

		attributes.put("providerId", this.providerId);
		attributes.put("userNickname", this.userNickname);
		attributes.put("userEmail", this.userEmail);
		attributes.put("userProfileImage", this.userProfileImage);

		return OAuth2UserInfoFactory.getOAuth2UserInfo(OAuth2UserInfo.getProviderType(providerType), attributes);
	}

}
