package com.ssafy.dimong_be.domain.model.user_badge;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.badge.Badge;
import com.ssafy.dimong_be.domain.model.common.BaseEntity;
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
@Table(name = "USER_BADGES", uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "badge_id"}))
public class UserBadge extends BaseEntity implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_badge_id")
	private Long userBadgeId;

	@Column(name = "user_id", nullable = false)
	private Long userId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", insertable = false, updatable = false)
	private User user;

	@Column(name = "badge_id", nullable = false)
	private Long badgeId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "badge_id", nullable = false, insertable = false, updatable = false)
	private Badge badge;

}
