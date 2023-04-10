package com.ssafy.dimong_be.application.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.DrawingService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.domain.model.drawing.Drawing;
import com.ssafy.dimong_be.domain.model.drawing.DrawingRepository;
import com.ssafy.dimong_be.interfaces.common.DrawingListDto;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;
import com.ssafy.dimong_be.interfaces.drawing.MyDrawingResponseDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class DrawingServiceImpl implements DrawingService {

	private final DrawingRepository drawingRepository;

	@Override
	public List<DrawingListDto> getDrawingList() {
		List<Drawing> drawingList = drawingRepository.findAll();

		List<DrawingListDto> response = new ArrayList<>();
		drawingList.forEach(drawing -> response.add(DrawingListDto.fromEntity(drawing)));

		return response;
	}

	@Override
	public List<Drawing> getDrawingList(Long userId) {
		return drawingRepository.findAllByUser_UserId(userId);
	}

	@Override
	public void saveDrawing(MyDrawingDto drawing) {
		drawingRepository.save(MyDrawingDto.toEntity(drawing));
	}

	@Override
	public MyDrawingResponseDto getDrawing(Long drawingId) {
		Drawing drawing = drawingRepository.findByIdWithJpql(drawingId)
			.orElseThrow(() -> new EntityNotFoundException(
				"drawingId(" + drawingId + ")에 해당하는 그림이 없습니다.",
				ErrorCode.ENTITY_NOT_FOUND)
			);

		MyDrawingResponseDto myDrawingResponseDto = MyDrawingResponseDto.builder()
			.drawingId(drawingId)
			.drawingImageUrl(drawing.getDrawingImageUrl())
			.userId(drawing.getUserId())
			.userNickname(drawing.getUser().getUserNickname())
			.build();

		// if (drawing.getSimilarDinosaurId1() != null) { //공룡이 아닐 경우에만 list 추가
			myDrawingResponseDto.addSimilarList(
				DinosaurRecommendationResponseDto.fromEntity(drawing.getSimilarDinosaur1())
			);

			myDrawingResponseDto.addSimilarList(
				DinosaurRecommendationResponseDto.fromEntity(drawing.getSimilarDinosaur2())
			);

			myDrawingResponseDto.addSimilarList(
				DinosaurRecommendationResponseDto.fromEntity(drawing.getSimilarDinosaur3())
			);
		// }

		return myDrawingResponseDto;
	}

	@Override
	public void deleteDrawing(Long drawingId) {
		drawingRepository.deleteById(drawingId);
	}

}
