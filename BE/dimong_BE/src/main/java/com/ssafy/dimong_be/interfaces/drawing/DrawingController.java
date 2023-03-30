package com.ssafy.dimong_be.interfaces.drawing;

import java.io.IOException;

import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.dimong_be.application.DrawingService;
import com.ssafy.dimong_be.application.FileUploadService;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingType;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class DrawingController {

	private static final String FREE_DRAWING_FOLDER_NAME = "user_drawing/free/"; //내맘대로 그리기
	private static final String GUIDE_DRAWING_FOLDER_NAME = "user_drawing/guide/"; //주제맞춰 그리기

	private final DrawingService drawingService;
	private final FileUploadService fileUploadService;

	@PostMapping("/v1/drawings/free")
	@Transactional
	public ResponseEntity saveDrawingAndGetRecommendation(@RequestParam("file") MultipartFile file, String fileName, Long userId) throws
		IOException {
		String imageUrl = fileUploadService.uploadFile(file, FREE_DRAWING_FOLDER_NAME + fileName);

		log.info("imageUrl: " + imageUrl);

		drawingService.saveDrawing(
			MyDrawingDto.builder()
				.userId(userId)
				.myDrawingUrl(imageUrl)
				.drawingType(DrawingType.FREE)
				.build()
		);

		return ResponseEntity.ok().build();
	}


}
