package com.ssafy.dimong_be.interfaces.common;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class FileDto {

	MultipartFile file;
	Long userId;

}
