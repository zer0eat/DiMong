package com.ssafy.dimong_be.domain.model.dinosaur;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
@NoArgsConstructor
@Entity
@Table(name = "DINOSAURS")
public class Dinosaur implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //Identity로 하면 디비엔진에 따라 오토 인크리먼트가 안먹는다.
	@Column(name = "dinosaur_id")
	private Long dinosaurId;

	@Column(name = "dinosaur_image_url", length = 2000)
	private String dinosaurImageUrl;

	@Column(name = "dinosaur_audio_url", length = 2000)
	private String dinosaurAudioUrl;

	@Column(name = "dinosaur_name", nullable = false)
	private String dinosaurName;

	@Column(name = "dinosaur_habitat", nullable = false)
	private String dinosaurHabitat;

	@Column(name = "dinosaur_taste", nullable = false)
	private String dinosaurTaste;

	@Column(name = "geologic_age", nullable = false)
	private String geologicAge;

	@Column(name = "dinosaur_weight", nullable = false)
	private String dinosaurWeight;

	@Column(name = "dinosaur_length", nullable = false)
	private String dinosaurLength;

	@Column(name = "dinosaur_nickname", nullable = false)
	private String dinosaurNickname;

	@Column(name = "dinosaur_intellect", nullable = true)
	private Integer dinosaurIntellect;

	@Column(name = "dinosaur_aggression", nullable = true)
	private Integer dinosaurAggression;

	@Column(name = "dinosaur_characteristic", nullable = false, length = 2000)
	private String dinosaurCharacteristic;



	// @Transient
	@Column(name = "is_collected")
	private boolean isCollected;

	// @Override
	// public boolean isCollected() {
	// 	return false;
	// }

	// public void setCollected(boolean isCollected) {
	// 	this.isCollected = isCollected;
	// }

	// @Embedded
	// UserDinosaurCollect userDinosaurCollect;

}
