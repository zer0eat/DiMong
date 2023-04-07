package com.ssafy.dimong_be.interfaces.drawing;

import java.io.Serializable;
import java.util.List;

import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Builder
public class DrawingRecommendationResponseDto implements Serializable {

	@Setter
	private boolean isFound;

	private List<DinosaurRecommendationResponseDto> similarDinosaurList;

}
