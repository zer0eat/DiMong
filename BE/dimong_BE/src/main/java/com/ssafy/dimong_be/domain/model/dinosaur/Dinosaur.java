package com.ssafy.dimong_be.domain.model.dinosaur;

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
public class Dinosaur {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //Identity로 하면 디비엔진에 따라 오토 인크리먼트가 안먹는다.
	@Column(name = "dinosaur_id")
	Long dinosaurId;

	@Column(name = "dinosaur_image_url")
	String dinosaurImageUrl;

	@Column(name = "dinosaur_audio_url")
	String dinosaurAudioUrl;

	@Column(name = "dinosaur_name", nullable = false)
	String dinosaurName;

	@Column(name = "dinosaur_habitat", nullable = false)
	String dinosaurHabitat;

	@Column(name = "dinosaur_taste", nullable = false)
	String dinosaurTaste;

	@Column(name = "geologic_age", nullable = false)
	String geologicAge;

	@Column(name = "dinosaur_weight", nullable = false)
	String dinosaurWeight;

	@Column(name = "dinosaur_length", nullable = false)
	String dinosaurLength;

	@Column(name = "dinosaur_nickname", nullable = false)
	String dinosaurNickname;

	@Column(name = "dinosaur_characteristic", nullable = false)
	String dinosaurCharacteristic;

}
