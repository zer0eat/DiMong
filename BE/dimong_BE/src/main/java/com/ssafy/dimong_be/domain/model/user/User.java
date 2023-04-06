package com.ssafy.dimong_be.domain.model.user;

import java.io.Serializable;

import org.hibernate.annotations.ColumnDefault;

import com.ssafy.dimong_be.domain.model.common.BaseEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "USERS", uniqueConstraints = @UniqueConstraint(columnNames = {"provider_type", "provider_id"}))
public class User extends BaseEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //Identity로 하면 디비엔진에 따라 오토 인크리먼트가 안먹는다.
	@Column(name = "user_id")
	private Long userId;

	@Column(name = "user_nickname", nullable = true)
	private String userNickname;

	@Column(name = "user_profile_image", nullable = true)
	private String userProfileImage;

	@Column(name = "is_deleted", nullable = false)
	@ColumnDefault(value = "0")
	private boolean isDeleted;

	@Column(name = "user_role", nullable = false)
	@Enumerated(EnumType.STRING)
	private UserRole userRole;

	@Column(name = "provider_type", nullable = true)
	@Enumerated(EnumType.STRING)
	private ProviderType providerType;

	@Column(name = "provider_id", nullable = true)
	private String providerId;

	@Setter
	@Column(name = "provider_access_token", nullable = true)
	private String providerAccessToken;

	// public List<String> getRoleList() {
	// 	if (this.userRole.length() > 0) {
	// 		return Arrays.asList(this.userRole.split(","));
	// 	}
	//
	// 	return new ArrayList<>();
	// }

	//////////////////////////////////////

	//==== 비즈니스 로직 ====//

}
