package com.ssafy.dimong_be.auth.exception;

public class UserHasNotAdminAuthorityException extends RuntimeException {
	public UserHasNotAdminAuthorityException() {
		super("관리자 권한만 사용할 수 있는 기능입니다.");
	}

	public UserHasNotAdminAuthorityException(String message) {
		super(message);
	}

	public UserHasNotAdminAuthorityException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserHasNotAdminAuthorityException(Throwable cause) {
		super(cause);
	}
}
