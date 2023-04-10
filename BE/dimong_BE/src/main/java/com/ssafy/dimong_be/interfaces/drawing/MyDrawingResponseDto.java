package com.ssafy.dimong_be.interfaces.drawing;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MyDrawingResponseDto implements Serializable {

	private Long drawingId;
	private String drawingImageUrl;
	private Long userId;
	private String userNickname;

	private final List<DinosaurRecommendationResponseDto> similarList = new ArrayList<>();

	// @Setter
	// private Long badgeId;

	public void addSimilarList(DinosaurRecommendationResponseDto dinosaurDto) {
		similarList.add(dinosaurDto);
	}

}
