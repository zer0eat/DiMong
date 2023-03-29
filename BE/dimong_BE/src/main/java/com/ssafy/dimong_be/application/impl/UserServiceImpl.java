package com.ssafy.dimong_be.application.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.UserService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.domain.model.badge.UserBadge;
import com.ssafy.dimong_be.domain.model.badge.UserBadgeReposiroty;
import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingRepository;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.domain.model.user.UserRepository;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;
import com.ssafy.dimong_be.interfaces.common.MypageDto;
import com.ssafy.dimong_be.interfaces.common.UserBadgeDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {
	private final DrawingRepository drawingRepository;

	private final UserBadgeReposiroty userBadgeReposiroty;
	private final UserRepository userRepository;

	@Override
	public User getUserInfo(Long userId) {
		return userRepository.findById(userId)
			.orElseThrow(
				() -> new EntityNotFoundException(
					"userId(" + userId + ") 에 해당하는 사용자 없음.",
					ErrorCode.USER_NOT_FOUND
				)
			);
	}

	@Override
	public MypageDto getMypageInfo(Long userId) {
		User userEntity = userRepository.findById(userId)
			.orElseThrow(
				() -> new EntityNotFoundException(
					"userId(" + userId + ") 에 해당하는 사용자 없음.",
					ErrorCode.USER_NOT_FOUND
				)
			);

		List<UserBadge> badgeList = userBadgeReposiroty.findAllByUser_UserId(userId);
		List<Drawing> drawingList = drawingRepository.findAllByUser_UserId(userId);

		MypageDto mypageDto = MypageDto.builder()
			.userId(userEntity.getUserId())
			.userProfileImage(userEntity.getUserProfileImage())
			.userNickname(userEntity.getUserNickname())
			.build();

		badgeList.forEach(userBadge -> mypageDto.addUserBadgeDto(UserBadgeDto.fromEntity(userBadge.getBadge())));
		drawingList.forEach(drawing -> mypageDto.addMyDrawingDto(MyDrawingDto.fromEntity(drawing)));

		return mypageDto;
	}

}
