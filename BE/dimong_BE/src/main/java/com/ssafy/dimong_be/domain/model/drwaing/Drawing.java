package com.ssafy.dimong_be.domain.model.drwaing;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.common.BaseEntity;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.user.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "DRAWINGS")
public class Drawing extends BaseEntity implements Serializable {

	@Id
	@Column(name = "drawing_id")
	Long drawingId;

	@Column(name = "drawing_image_url", nullable = false)
	String drawingImageUrl;

	@Column(name = "drawing_type", nullable = false)
	@Enumerated(EnumType.STRING)
	DrawingType drawingType;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "similar_dinosaur_id_1", nullable = true)
	Dinosaur similarDinosaur1;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "similar_dinosaur_id_2", nullable = true)
	Dinosaur similarDinosaur2;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "similar_dinosaur_id_3", nullable = true)
	Dinosaur similarDinosaur3;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	User user;

}
