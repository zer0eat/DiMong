package com.ssafy.dimong_be.application.impl;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.UserService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityAlreadyExistException;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.auth.jwt.AuthToken;
import com.ssafy.dimong_be.auth.jwt.AuthTokenProvider;
import com.ssafy.dimong_be.auth.properties.AppProperties;
import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfo;
import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingRepository;
import com.ssafy.dimong_be.domain.model.user.ProviderType;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.domain.model.user.UserRepository;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadgeRepository;
import com.ssafy.dimong_be.interfaces.common.DrawingListDto;
import com.ssafy.dimong_be.interfaces.mypage.MypageResponseDto;
import com.ssafy.dimong_be.interfaces.user.AuthResponseDto;
import com.ssafy.dimong_be.interfaces.user.OAuthProviderDto;

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

	private final AuthTokenProvider authTokenProvider;
	private final AppProperties appProperties;

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

		// List<UserBadge> badgeList = userBadgeRepository.findAllByUser_UserId(userId);
		List<Drawing> drawingList = drawingRepository.findAllByUser_UserId(userId);

		MypageResponseDto mypageResponseDto = MypageResponseDto.builder()
			.userId(userEntity.getUserId())
			.userProfileImage(userEntity.getUserProfileImage())
			.userNickname(userEntity.getUserNickname())
			.build();

		// badgeList.forEach(userBadge -> mypageResponseDto.addUserBadgeDto(UserBadgeDto.fromEntity(userBadge.getBadge())));
		drawingList.forEach(drawing -> mypageResponseDto.addMyDrawingDto(DrawingListDto.fromEntity(drawing)));

		return mypageResponseDto;
	}

	@Override
	public AuthResponseDto signup(OAuth2UserInfo userInfo, ProviderType providerType) {
		// 이미 가입된 회원인지 검증
		if (userRepository.existsByProviderTypeAndProviderId(providerType, userInfo.getId())) {
			throw new EntityAlreadyExistException (
				"providerId(" + userInfo.getId() + ")에 해당하는 사용자가 이미 존재합니다.",
				ErrorCode.USER_ALREADY_EXIST
			);
		}

		//DB에 저장
		User user = userRepository.saveAndFlush(OAuth2UserInfo.toEntity(userInfo, providerType));

		//accessToken 발급
		Date now = new Date();
		AuthToken authToken= authTokenProvider.createAuthToken(String.valueOf(user.getUserId()), user.getUserRole().getCode(), new Date(now.getTime() + appProperties.getAuth().getTokenExpiry()));

		return AuthResponseDto.fromEntity(user, authToken.getToken());
	}

	@Override
	public AuthResponseDto login(OAuthProviderDto oAuthProviderDto) {
		//DB에서 조회
		User user = userRepository.findByProviderId(oAuthProviderDto.getProviderId())
			.orElseThrow(() -> new EntityNotFoundException(
				"providerId(" + oAuthProviderDto.getProviderId() + ")에 해당하는 사용자가 존재하지 않습니다.",
				ErrorCode.USER_NOT_FOUND
			));

		//accessToken 발급
		Date now = new Date();
		AuthToken authToken= authTokenProvider.createAuthToken(String.valueOf(user.getUserId()), user.getUserRole().getCode(), new Date(now.getTime() + appProperties.getAuth().getTokenExpiry()));

		//authentication 저장
		SecurityContextHolder.getContext().setAuthentication(authTokenProvider.getAuthentication(authToken));

		return AuthResponseDto.fromEntity(user, authToken.getToken());
	}

}
