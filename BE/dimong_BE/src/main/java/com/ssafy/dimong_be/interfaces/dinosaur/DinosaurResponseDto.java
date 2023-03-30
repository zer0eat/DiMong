package com.ssafy.dimong_be.interfaces.dinosaur;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class DinosaurResponseDto implements Serializable {

	private Long dinosaurId;
	private String dinosaurImageUrl;
	private String dinosaurName;

	public static DinosaurResponseDto fromEntity(Dinosaur dinosaur) {
		return DinosaurResponseDto.builder()
			.dinosaurId(dinosaur.getDinosaurId())
			.dinosaurImageUrl(dinosaur.getDinosaurImageUrl())
			.dinosaurName(dinosaur.getDinosaurName())
			.build();
	}

}
