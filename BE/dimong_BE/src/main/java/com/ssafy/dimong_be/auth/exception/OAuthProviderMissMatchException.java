package com.ssafy.dimong_be.auth.exception;

public class OAuthProviderMissMatchException extends RuntimeException {

	public OAuthProviderMissMatchException(String message) {
		super(message);
	}
}
