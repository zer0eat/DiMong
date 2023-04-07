package com.ssafy.dimong_be.interfaces.mypage;

import com.ssafy.dimong_be.domain.model.badge.Badge;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder(toBuilder = true)
public class BadgeResponseDto {

	private Long badgeId;
	private String badgeName;
	private String badgeImageUrl;
	private boolean isCollected;
	private String createdAt;

	public static BadgeResponseDto fromEntity(Badge badge, boolean isCollected, String createdAt) {
		return BadgeResponseDto.builder()
			.badgeId(badge.getBadgeId())
			.badgeName(badge.getBadgeName())
			.badgeImageUrl(badge.getBadgeImageUrl())
			.isCollected(isCollected)
			.createdAt(createdAt)
			.build();
	}

}
