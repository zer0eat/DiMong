package com.ssafy.dimong_be.application.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.UserService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingRepository;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.domain.model.user.UserRepository;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadge;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadgeRepository;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;
import com.ssafy.dimong_be.interfaces.common.MypageResponseDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {
	private final DrawingRepository drawingRepository;
	private final UserBadgeRepository userBadgeRepository;
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
	public MypageResponseDto getMypageInfo(Long userId) {
		User userEntity = userRepository.findById(userId)
			.orElseThrow(
				() -> new EntityNotFoundException(
					"userId(" + userId + ") 에 해당하는 사용자 없음.",
					ErrorCode.USER_NOT_FOUND
				)
			);

		List<UserBadge> badgeList = userBadgeRepository.findAllByUser_UserId(userId);
		List<Drawing> drawingList = drawingRepository.findAllByUser_UserId(userId);

		MypageResponseDto mypageResponseDto = MypageResponseDto.builder()
			.userId(userEntity.getUserId())
			.userProfileImage(userEntity.getUserProfileImage())
			.userNickname(userEntity.getUserNickname())
			.build();

		// badgeList.forEach(userBadge -> mypageResponseDto.addUserBadgeDto(UserBadgeDto.fromEntity(userBadge.getBadge())));
		drawingList.forEach(drawing -> mypageResponseDto.addMyDrawingDto(MyDrawingDto.fromEntity(drawing)));

		return mypageResponseDto;
	}

}
