package com.ssafy.dimong_be.auth.exception;

import com.ssafy.dimong_be.application.exception.BusinessException;
import com.ssafy.dimong_be.application.exception.ErrorCode;

public class OAuthUserAlreadyExistException extends BusinessException {
	public OAuthUserAlreadyExistException(String message, ErrorCode errorCode) {
		super(message, errorCode);
	}

	public OAuthUserAlreadyExistException(ErrorCode errorCode) {
		super(errorCode);
	}
}
