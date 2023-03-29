package com.ssafy.dimong_be.interfaces.common;

import java.io.Serializable;

import com.ssafy.dimong_be.domain.model.badge.Badge;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class UserBadgeDto implements Serializable {

	private Long badgeId;
	private String badgeImageUrl;
	private String badgeName;

	public static UserBadgeDto fromEntity(Badge badge) {
		return UserBadgeDto.builder()
			.badgeId(badge.getBadgeId())
			.badgeImageUrl(badge.getBadgeImageUrl())
			.badgeName(badge.getBadgeName())
			.build();
	}

}
