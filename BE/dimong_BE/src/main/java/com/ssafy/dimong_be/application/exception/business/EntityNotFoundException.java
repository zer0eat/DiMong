package com.ssafy.dimong_be.application.exception.business;

import com.ssafy.dimong_be.application.exception.BusinessException;
import com.ssafy.dimong_be.application.exception.ErrorCode;

public class EntityNotFoundException extends BusinessException {

	public EntityNotFoundException(String message, ErrorCode errorCode) {
		super(message, errorCode);
	}

}