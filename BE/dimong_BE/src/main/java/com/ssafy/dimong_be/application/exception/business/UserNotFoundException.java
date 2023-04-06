package com.ssafy.dimong_be.application.exception.business;

import com.ssafy.dimong_be.application.exception.BusinessException;
import com.ssafy.dimong_be.application.exception.ErrorCode;

public class UserNotFoundException extends BusinessException {

	public UserNotFoundException(String message) {
		super(message, ErrorCode.USER_NOT_FOUND);
	}

	public UserNotFoundException(ErrorCode errorCode) {
		super(ErrorCode.USER_NOT_FOUND);
	}

}