package com.ssafy.dimong_be.interfaces.drawing;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.dimong_be.application.BadgeService;
import com.ssafy.dimong_be.application.DinosaurService;
import com.ssafy.dimong_be.application.DrawingService;
import com.ssafy.dimong_be.application.FileUploadService;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingType;
import com.ssafy.dimong_be.interfaces.common.FileDto;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
@Slf4j
public class DrawingController {

	private static final String DRAWING_FOLDER_NAME = "user_drawing/";
	private final DinosaurService dinosaurService;
	private final DrawingService drawingService;
	private final BadgeService badgeService;
	private final FileUploadService fileUploadService;

	@PostMapping("/v1/drawings/dinosaurs/live")
	@Transactional
	public ResponseEntity<DrawingResponseDto> getRecommendation(@RequestParam("file") MultipartFile file, Long userId) {
		//공룡 3종류 추천
		List<DinosaurRecommendationResponseDto> responseDtoList = dinosaurService.getDinosaurList(
			FileDto.builder()
				.file(file)
				.userId(userId)
				.build()
		);

		DrawingResponseDto drawingResponseDto = DrawingResponseDto.builder().similarDinosaurList(responseDtoList).build();

		if (responseDtoList.isEmpty()) {
			drawingResponseDto.setFound(false);
		} else {
			drawingResponseDto.setFound(true);
		}

		return ResponseEntity.ok(drawingResponseDto);
	}

	@PostMapping("/v1/drawings/dinosaurs")
	@Transactional
	public ResponseEntity<DrawingResponseDto> saveDrawingAndGetRecommendation(@RequestParam("file") MultipartFile file, Long userId) throws
		IOException {
		//1. 공룡 3종류 추천
		List<DinosaurRecommendationResponseDto> responseDtoList = dinosaurService.getDinosaurList(
			FileDto.builder()
				.file(file)
				.userId(userId)
				.build()
		);

		//2. 그림 파일 업로드
		UUID uuid = UUID.randomUUID();
		String imageUrl = fileUploadService.uploadFile(file, DRAWING_FOLDER_NAME + uuid);

		log.info("imageUrl: " + imageUrl);

		//3. 그림 파일 정보, 비슷한 공룡 3종류, 획득한 뱃지 포함해서 DB에 저장
		MyDrawingDto myDrawingDto = MyDrawingDto.builder() //그림 파일 정보 저장
			.userId(userId)
			.myDrawingUrl(imageUrl)
			.drawingType(DrawingType.FREE)
			.build();
		
		if (responseDtoList.size() != 0) { //비슷한 공룡이 있으면 비슷한 공룡 3종류, 획득한 뱃지 저장
			Long badgeId = badgeService.getBadgeIdByDinosaurId(responseDtoList.get(0).getDinosaurId());

			myDrawingDto = myDrawingDto.toBuilder()
				.badgeId(badgeId)
				.similarDinosaurId1(responseDtoList.get(0).getDinosaurId())
				.similarDinosaurId2(responseDtoList.get(1).getDinosaurId())
				.similarDinosaurId3(responseDtoList.get(2).getDinosaurId())
				.build();
		}

		drawingService.saveDrawing(myDrawingDto);

		//4. Response 준비
		DrawingResponseDto drawingResponseDto = DrawingResponseDto.builder().similarDinosaurList(responseDtoList).build();

		if (responseDtoList.isEmpty()) {
			drawingResponseDto.setFound(false);
		} else {
			drawingResponseDto.setFound(true);
		}

		return ResponseEntity.ok(drawingResponseDto);
	}

}
