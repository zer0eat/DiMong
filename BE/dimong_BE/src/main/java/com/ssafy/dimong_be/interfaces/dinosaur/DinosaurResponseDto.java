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
	private String dinosaurAudioUrl;
	private String dinosaurName;
	private String dinosaurHabitat;
	private String dinosaurTaste;
	private String geologicAge;
	private String dinosaurWeight;
	private String dinosaurLength;
	private String dinosaurNickname;
	private Integer dinosaurIntellect;
	private Integer dinosaurAggression;
	private String dinosaurCharacteristic;

	public static DinosaurResponseDto fromEntity(Dinosaur dinosaur) {
		return DinosaurResponseDto.builder()
			.dinosaurId(dinosaur.getDinosaurId())
			.dinosaurImageUrl(dinosaur.getDinosaurImageUrl())
			.dinosaurAudioUrl(dinosaur.getDinosaurAudioUrl())
			.dinosaurName(dinosaur.getDinosaurName())
			.dinosaurHabitat(dinosaur.getDinosaurHabitat())
			.dinosaurTaste(dinosaur.getDinosaurTaste())
			.geologicAge(dinosaur.getGeologicAge())
			.dinosaurWeight(dinosaur.getDinosaurWeight())
			.dinosaurLength(dinosaur.getDinosaurLength())
			.dinosaurNickname(dinosaur.getDinosaurNickname())
			.dinosaurIntellect(dinosaur.getDinosaurIntellect())
			.dinosaurAggression(dinosaur.getDinosaurAggression())
			.dinosaurCharacteristic(dinosaur.getDinosaurCharacteristic())
			.build();
	}

}
