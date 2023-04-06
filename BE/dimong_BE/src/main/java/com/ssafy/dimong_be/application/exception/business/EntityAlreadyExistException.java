package com.ssafy.dimong_be.application.exception.business;

import com.ssafy.dimong_be.application.exception.BusinessException;
import com.ssafy.dimong_be.application.exception.ErrorCode;

public class EntityAlreadyExistException extends BusinessException {

	public EntityAlreadyExistException(String message, ErrorCode errorCode) {
		super(message, errorCode);
	}

}