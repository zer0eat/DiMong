package com.ssafy.dimong_be.application.exception;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ErrorCode { // Response body에 담기는 값. 프론트에 보여짐!

	// Common
	INVALID_INPUT_VALUE(400, "C001", "Invalid Input Value"),
	METHOD_NOT_ALLOWED(405, "C002", "Invalid Input Value"),
	ENTITY_NOT_FOUND(400, "C003", " Entity Not Found"),
	INTERNAL_SERVER_ERROR(500, "C004", "Server Error"),
	INVALID_TYPE_VALUE(400, "C005", " Invalid Type Value"),
	HANDLE_ACCESS_DENIED(403, "C006", "Access is Denied"),
	SEARCH_USER_NOT_FOUND(400, "C007", "검색 결과가 없습니다."),
	USER_NOT_FOUND(400, "C008", "존재하지 않는 사용자입니다."),
	GITHUB_USER_ALREADY_EXIST(400, "C009", "이미 존재하는 Github 사용자입니다."),

	// Member
	EMAIL_DUPLICATION(400, "M001", "Email is Duplication"),
	LOGIN_INPUT_INVALID(400, "M002", "아이디나 비밀번호가 일치하지 않습니다."),
	GITHUB_AUTHENTICATION_TOKEN_INVALID(400, "M003", "오류가 발생했습니다."),

	// Coupon
	COUPON_ALREADY_USE(400, "CO001", "Coupon was already used"),
	COUPON_EXPIRE(400, "CO002", "Coupon was already expired");

	private final String code;
	private final String message;
	private int status;

	ErrorCode(final int status, final String code, final String message) {
		this.status = status;
		this.message = message;
		this.code = code;
	}

	public String getMessage() {
		return this.message;
	}

	public String getCode() {
		return code;
	}

	public int getStatus() {
		return status;
	}

}