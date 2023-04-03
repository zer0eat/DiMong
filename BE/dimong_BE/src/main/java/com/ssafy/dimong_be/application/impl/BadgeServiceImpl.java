package com.ssafy.dimong_be.application.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.BadgeService;
import com.ssafy.dimong_be.domain.model.badge.Badge;
import com.ssafy.dimong_be.domain.model.badge.BadgeQueryRepository;
import com.ssafy.dimong_be.domain.model.badge.BadgeRepository;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadgeRepository;
import com.ssafy.dimong_be.interfaces.mypage.BadgeResponseDto;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BadgeServiceImpl implements BadgeService {

	private final UserBadgeRepository userBadgeRepository;
	private final BadgeRepository badgeRepository;
	private final BadgeQueryRepository badgeQueryRepository;

	private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public List<BadgeResponseDto> getBadgeList(Long userId) {
		List<Object[]> userCollectedBadgeList = badgeQueryRepository.findWithUser(userId);

		List<BadgeResponseDto> badgeResponseDtoList = new ArrayList<>();
		userCollectedBadgeList.forEach(result -> {
			Long badgeId = (Long) result[0];
			String badgeImageUrl = (String) result[1];
			String badgeName = (String) result[2];

			boolean isCollected = result[4] != null;

			Timestamp createdAt = (Timestamp) result[5];
			String createdAtStr = createdAt == null ? "" : dateFormat.format(createdAt);

			badgeResponseDtoList.add(BadgeResponseDto.fromEntity(
				Badge.builder()
					.badgeId(badgeId)
					.badgeImageUrl(badgeImageUrl)
					.badgeName(badgeName)
					.build(),
				isCollected,
				createdAtStr
			));
		});

		return badgeResponseDtoList;
	}

	@Override
	public Long getBadgeIdByDinosaurId(Long dinosaurId) {
		return badgeRepository.findByDinosaurId(dinosaurId).orElseThrow().getBadgeId();
	}

}
