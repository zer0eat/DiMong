package com.ssafy.dimong_be.auth.exception;

public class RefreshTokenNotFoundException extends RuntimeException {

	public RefreshTokenNotFoundException() {
		super("리프레시 토큰을 찾을 수 없습니다.");
	}

	public RefreshTokenNotFoundException(String message) {
		super(message);
	}

	public RefreshTokenNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public RefreshTokenNotFoundException(Throwable cause) {
		super(cause);
	}

}
