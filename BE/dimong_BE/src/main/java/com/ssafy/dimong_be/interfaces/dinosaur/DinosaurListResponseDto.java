package com.ssafy.dimong_be.interfaces.dinosaur;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class DinosaurListResponseDto implements Serializable {

	private Long dinosaurId;
	private String dinosaurImageUrl;
	private String dinosaurName;

	public static DinosaurListResponseDto fromEntity(Dinosaur dinosaur) {
		return DinosaurListResponseDto.builder()
			.dinosaurId(dinosaur.getDinosaurId())
			.dinosaurImageUrl(dinosaur.getDinosaurImageUrl())
			.dinosaurName(dinosaur.getDinosaurName())
			.build();
	}

}
