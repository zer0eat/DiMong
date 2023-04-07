package com.ssafy.dimong_be.auth.exception;

public class RefreshTokenValidFailedException extends RuntimeException {

	public RefreshTokenValidFailedException() {
		super("유효하지 않은 리프레시 토큰입니다.");
	}

	public RefreshTokenValidFailedException(String message) {
		super(message);
	}

	public RefreshTokenValidFailedException(String message, Throwable cause) {
		super(message, cause);
	}

	public RefreshTokenValidFailedException(Throwable cause) {
		super(cause);
	}

}
