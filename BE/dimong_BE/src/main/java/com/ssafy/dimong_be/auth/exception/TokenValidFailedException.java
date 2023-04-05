package com.ssafy.dimong_be.auth.exception;

public class TokenValidFailedException extends RuntimeException {

	public TokenValidFailedException() {
		super("Failed to generate Token.");
	}

	private TokenValidFailedException(String message) {
		super(message);
	}
}
