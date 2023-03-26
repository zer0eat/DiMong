package com.ssafy.dimong_be.domain.model.badge;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
public class Badge {

	@Id
	@Column(name = "badge_id")
	Long badgeId;

	@Column(name = "badge_name")
	String badgeName;

	@Column(name = "badge_image_url")
	String badgeImageUrl;

	@OneToOne
	@JoinColumn(name = "dinosaur_id")
	Dinosaur dinosaur;

}
