package com.ssafy.dimong_be.domain.model.drwaing;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.badge.Badge;
import com.ssafy.dimong_be.domain.model.common.BaseEntity;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.user.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "drawing_id")
	private Long drawingId;

	@Column(name = "drawing_image_url", nullable = false)
	private String drawingImageUrl;

	@Column(name = "drawing_type", nullable = false)
	@Enumerated(EnumType.STRING)
	private DrawingType drawingType;

	@Column(name = "similar_dinosaur_id_1", nullable = true)
	private Long similarDinosaurId1;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "similar_dinosaur_id_1", nullable = true, insertable = false, updatable = false)
	private Dinosaur similarDinosaur1;

	@Column(name = "similar_dinosaur_id_2", nullable = true)
	private Long similarDinosaurId2;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "similar_dinosaur_id_2", nullable = true, insertable = false, updatable = false)
	private Dinosaur similarDinosaur2;

	@Column(name = "similar_dinosaur_id_3", nullable = true)
	private Long similarDinosaurId3;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "similar_dinosaur_id_3", nullable = true, insertable = false, updatable = false)
	private Dinosaur similarDinosaur3;

	@Column(name = "user_id", nullable = false)
	private Long userId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", insertable = false, updatable = false)
	private User user;

	@Column(name = "badge_id", nullable = true)
	private Long badgeId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "badge_id", insertable = false, updatable = false)
	private Badge badge;

	// @ManyToOne(fetch = FetchType.LAZY)
	// @JoinColumn(name = "badge_id")
	// private Badge badge;

}
