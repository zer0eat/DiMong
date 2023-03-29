package com.ssafy.dimong_be.application;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	public String uploadFile(MultipartFile file, String fileName) throws IOException;

}
