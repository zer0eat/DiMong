package com.ssafy.dimong_be.domain.model.dinosaur;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.user.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
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
	@Column(name = "user_dinosaur_id")
	Long userDinosaurId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	User user;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dinosaur_id")
	Dinosaur dinosaur;

}
