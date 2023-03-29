package com.ssafy.dimong_be.domain.model.badge;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.common.BaseEntity;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
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
@Table(name = "BADGES")
public class Badge extends BaseEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "badge_id")
	private Long badgeId;

	@Column(name = "badge_name")
	private String badgeName;

	@Column(name = "badge_image_url")
	private String badgeImageUrl;

	@OneToOne
	@JoinColumn(name = "dinosaur_id")
	private Dinosaur dinosaur;

}
