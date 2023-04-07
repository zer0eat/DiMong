package com.ssafy.dimong_be.domain.model.user;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "USER_REFRESH_TOKEN")
@Builder(toBuilder = true)
public class UserRefreshToken implements Serializable {
	@JsonIgnore
	@Id
	@Column(name = "refresh_token_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long refreshTokenId;

	@Column(name = "user_id")
	private Long userId;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", unique = true, insertable = false, updatable = false)
	private User user;

	@Column(name = "refresh_token", length = 256)
	@Size(max = 256)
	private String refreshToken;

	// public UserRefreshToken(
	// 	@NotNull @Size(max = 64) Long userId,
	// 	@NotNull @Size(max = 256) String refreshToken
	// ) {
	// 	this.userId = userId;
	// 	this.refreshToken = refreshToken;
	// }

	// public UserRefreshToken(
	// 	@NotNull @Size(max = 64) String userId,
	// 	@NotNull @Size(max = 256) String refreshToken
	// ) {
	// 	this.userId = userId;
	// 	this.refreshToken = refreshToken;
	// }

	public void updateToken(String token) {
		this.refreshToken = token;
	}

}
