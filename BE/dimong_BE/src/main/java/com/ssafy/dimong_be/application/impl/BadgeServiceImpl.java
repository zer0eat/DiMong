package com.ssafy.dimong_be.application.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.BadgeService;
import com.ssafy.dimong_be.domain.model.badge.BadgeRepository;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadge;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadgeRepository;
import com.ssafy.dimong_be.interfaces.common.UserBadgeDto;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BadgeServiceImpl implements BadgeService {

	private final UserBadgeRepository userBadgeRepository;
	private final BadgeRepository badgeRepository;

	@Override
	public UserBadgeDto getBadgeList(Long userId) {
		List<UserBadge> userBadgeList = userBadgeRepository.findAllByUser_UserId(userId);

		UserBadgeDto userBadgeDto = UserBadgeDto.fromEntity(userBadgeList.get(0));
		userBadgeList.forEach(userBadge -> UserBadgeDto.fromEntity(userBadge));
		return null;
	}

	@Override
	public Long getBadgeIdByDinosaurId(Long dinosaurId) {
		return badgeRepository.findByDinosaurId(dinosaurId).orElseThrow().getBadgeId();
	}

}
