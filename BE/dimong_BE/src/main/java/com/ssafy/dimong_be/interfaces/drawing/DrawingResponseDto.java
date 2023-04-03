package com.ssafy.dimong_be.interfaces.drawing;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Builder
public class DrawingResponseDto {

	@Setter
	private boolean isFound;

	private List<DinosaurRecommendationResponseDto> similarDinosaurList;

}
