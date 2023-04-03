package com.ssafy.dimong_be.domain.model.badge;

import java.io.Serializable;

import org.hibernate.annotations.ColumnDefault;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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
public class Badge implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "badge_id")
	private Long badgeId;

	@Column(name = "badge_name")
	private String badgeName;

	@Column(name = "badge_image_url")
	private String badgeImageUrl;

	@Column(name = "dinosaur_id")
	private Long dinosaurId;

	@OneToOne
	@Transient
	@JoinColumn(name = "dinosaur_id", insertable = false, updatable = false)
	private Dinosaur dinosaur;

	@Column(name = "is_collected")
	@ColumnDefault(value = "0")
	private boolean isCollected;

}
