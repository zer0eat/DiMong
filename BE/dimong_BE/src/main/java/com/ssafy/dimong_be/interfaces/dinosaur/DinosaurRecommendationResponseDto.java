package com.ssafy.dimong_be.interfaces.dinosaur;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Builder
public class DinosaurRecommendationResponseDto {

	@Setter
	boolean isFound;

	Long dinosaurId;
	String dinosaurName;
	String dinosaurImageUrl;

	public static DinosaurRecommendationResponseDto fromEntity(Dinosaur dinosaur) {
		return DinosaurRecommendationResponseDto.builder()
			.dinosaurId(dinosaur.getDinosaurId())
			.dinosaurName(dinosaur.getDinosaurName())
			.dinosaurImageUrl(dinosaur.getDinosaurImageUrl())
			.build();
	}

}
