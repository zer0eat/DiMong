package com.ssafy.dimong_be.interfaces.drawing;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

	/*
	ver.1) 내 그림 상세 조회
	 */
	// @GetMapping("/v1/drawings/{drawingId}")
	// public ResponseEntity<MyDrawingResponseDto> getMyDrawing(@PathVariable Long drawingId) {
	// 	return ResponseEntity.ok(drawingService.getDrawing(drawingId));
	// }

	/*
	ver.2) 내 그림 상세 조회 & 갤러리 상세 조회
	 */
	@GetMapping("/v2/drawings/{drawingId}")
	public ResponseEntity<MyDrawingResponseDto> getMyDrawing(@PathVariable Long drawingId) {
		return ResponseEntity.ok(drawingService.getDrawing(drawingId));
	}

	/*
	그림 그려서 실시간 공룡 추천
	 */
	@PostMapping("/v1/drawings/dinosaurs/live")
	@Transactional
	public ResponseEntity<DrawingRecommendationResponseDto> getRecommendation(@RequestParam("file") MultipartFile file, Long userId) {
		//공룡 3종류 추천
		List<DinosaurRecommendationResponseDto> responseDtoList = dinosaurService.getDinosaurList(
			FileDto.builder()
				.file(file)
				.userId(userId)
				.build(),
			true
		);

		DrawingRecommendationResponseDto drawingRecommendationResponseDto = DrawingRecommendationResponseDto.builder().similarDinosaurList(responseDtoList).build();

		if (responseDtoList.isEmpty()) {
			drawingRecommendationResponseDto.setFound(false);
		} else {
			drawingRecommendationResponseDto.setFound(true);
		}

		return ResponseEntity.ok(drawingRecommendationResponseDto);
	}

	/*
	공룡 추천, 내 그림 저장, 뱃지 획득
	 */
	@PostMapping("/v1/drawings/dinosaurs")
	@Transactional
	public ResponseEntity<DrawingRecommendationResponseDto> saveDrawingAndGetRecommendation(@RequestParam("file") MultipartFile file, Long userId) throws
		IOException {
		//1. 공룡 3종류 추천
		List<DinosaurRecommendationResponseDto> responseDtoList = dinosaurService.getDinosaurList(
			FileDto.builder()
				.file(file)
				.userId(userId)
				.build(),
			false
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
		DrawingRecommendationResponseDto drawingRecommendationResponseDto = DrawingRecommendationResponseDto.builder().similarDinosaurList(responseDtoList).build();

		if (responseDtoList.isEmpty()) {
			drawingRecommendationResponseDto.setFound(false);
		} else {
			drawingRecommendationResponseDto.setFound(true);
		}

		return ResponseEntity.ok(drawingRecommendationResponseDto);
	}

}
