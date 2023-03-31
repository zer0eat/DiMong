package com.ssafy.dimong_be.domain.model.dinosaur;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DinosaurQueryRepository {

	private final EntityManager em;

	public List<Dinosaur> findAllByUserDinosaur_UserId(Long userId) {
		return em.createNativeQuery(
				new StringBuilder()
					.append("SELECT d.dinosaur_id, d.dinosaur_name, d.dinosaur_audio_url, d.dinosaur_habitat, d.geologic_age, d.dinosaur_weight, d.dinosaur_length, d.dinosaur_nickname, d.dinosaur_intellect, d.dinosaur_aggression, d.dinosaur_characteristic, d.dinosaur_image_url, d.dinosaur_taste, IFNULL(ud2.user_id, 0) AS is_collected ")
					// .append("SELECT d.dinosaur_id, d.dinosaur_name, d.dinosaur_image_url, d.dinosaur_taste, IFNULL(ud2.user_id, 0) AS is_collected ")
					.append("FROM DINOSAURS d ")
					.append("LEFT JOIN (")
						.append("SELECT ud1.user_id, ud1.dinosaur_id ")
						.append("FROM USER_DINOSAURS ud1 ")
						.append("WHERE ud1.user_id = ?) ud2 ")
					.append("ON d.dinosaur_id = ud2.dinosaur_id")
					.toString()
				, Dinosaur.class)
			.setParameter(1, userId)
			.getResultList();
	}
}
