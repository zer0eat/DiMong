package com.ssafy.dimong_be.domain.model.user_dinosaur;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.user.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.persistence.UniqueConstraint;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
@NoArgsConstructor
@Entity
@Table(name = "USER_DINOSAURS", uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "dinosaur_id"}))
public class UserDinosaur implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_dinosaur_id")
	private Long userDinosaurId;

	@Column(name = "user_id")
	private Long userId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
	private User user;

	@Column(name = "dinosaur_id")
	private Long dinosaurId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dinosaur_id", nullable = false, insertable = false, updatable = false)
	private Dinosaur dinosaur;

}
