package com.ssafy.dimong_be.interfaces.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dimong_be.domain.model.badge.Badge;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadge;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class UserBadgeDto implements Serializable {

	private Long userBadgeId;
	private Long userId;
	private final List<Badge> badgeList = new ArrayList<>();

	public static UserBadgeDto fromEntity(UserBadge userBadge) {
		return UserBadgeDto.builder()
			.userBadgeId(userBadge.getUserBadgeId())
			.userId(userBadge.getUserId())
			.build();
	}

	public void addMyBadge(Badge badge) {
		badgeList.add(badge);
	}

}
