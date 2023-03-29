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

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class DrawingController {

	private final DrawingService drawingService;
	private final FileUploadService fileUploadService;

	@PostMapping("/v1/drawings/free")
	@Transactional
	public ResponseEntity getDinosaurList(@RequestParam("file") MultipartFile file, String fileName, Long userId) throws
		IOException {
		String imageUrl = fileUploadService.uploadFile(file, fileName);

		drawingService.saveDrawing(
			MyDrawingDto.builder()
				.myDrawingUrl(imageUrl)
				.drawingType(DrawingType.FREE)
				.build()
		);

		return ResponseEntity.ok().build();
	}

}
