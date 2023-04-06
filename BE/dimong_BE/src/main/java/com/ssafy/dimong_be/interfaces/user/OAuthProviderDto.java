package com.ssafy.dimong_be.interfaces.user;

import java.io.Serializable;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class OAuthProviderDto implements Serializable {

	private String providerType;
	private String providerId;

}
