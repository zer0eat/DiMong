package com.ssafy.dimong_be.application.impl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.firebase.cloud.StorageClient;
import com.ssafy.dimong_be.application.FileUploadService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class FirebaseFileUploadServiceImpl implements FileUploadService {

	@Value("${app.firebase-bucket}")
	private String firebaseBucket;

	@Override
	public String uploadFile(MultipartFile file, String fileName) throws IOException {
		Bucket bucket = StorageClient.getInstance().bucket(firebaseBucket);
		InputStream content = new ByteArrayInputStream(file.getBytes());
		Blob blob = bucket.create(fileName, content, file.getContentType());

		return blob.getMediaLink(); //file url return
	}

}
