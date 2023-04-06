package com.ssafy.dimong_be.auth.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.auth.jwt.AuthTokenProvider;
import com.ssafy.dimong_be.auth.properties.AppProperties;
import com.ssafy.dimong_be.domain.model.user.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class AuthService {

	private final AppProperties appProperties;
	private final UserRepository userRepository;
	// private final UserRefreshTokenRepository userRefreshTokenRepository;
	// private final JwtTokenProvider jwtTokenProvider;
	private final AuthTokenProvider authTokenProvider;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	private final static long THREE_DAYS_MSEC = 259200000;
	private final static String REFRESH_TOKEN = "refreshToken";

	// private final FollowService followService;

	// 요청한 리프레시 토큰만 정상적인 토큰이라면, 엑세스 토큰만 새로 발급하여 클라이언트에게 돌려준다.
	// 이 때, 리프레시 토큰은 추가적으로 DB에 저장한다.
	// @Transactional
	// public JwtToken refresh(String refreshToken) {
	// 	// 요청한 리프레시 토큰에 문제 발생
	// 	if (!jwtTokenProvider.verifyToken(refreshToken)) {
	// 		throw new RefreshTokenValidFailedException();
	// 	}
	//
	// 	Long userId = jwtTokenProvider.getUserId(refreshToken);
	//
	// 	// 토큰에 등록되어 있는 사용자가 실제 있는 사용자인지 확인
	// 	User user = userRepository.findOneByUserId(userId).orElseThrow(UserNotFoundException::new);
	//
	// 	// 사용자와 연관된 리프레시 토큰이 DB 에 저장되어 있는지 확인
	// 	UserRefreshToken newRefreshToken = userRefreshTokenRepository.findOneByUserId(userId)
	// 		.orElseThrow(RefreshTokenNotFoundException::new);
	//
	// 	// 요청한 리프레시 토큰과 DB 에 저장되어 있는 리프레시 토큰이 일치하는지 확인
	// 	if (!newRefreshToken.getRefreshToken().equals(refreshToken)) {
	// 		throw new RefreshTokenValidFailedException();
	// 	}
	//
	// 	JwtToken reissuedJwtToken = jwtTokenProvider.createJwtToken(String.valueOf(userId));
	// 	newRefreshToken.updateToken(reissuedJwtToken.getRefreshToken());
	//
	// 	return reissuedJwtToken;
	// }

	// @Transactional
	// public UserDto signUp(SignupRequestDto signupRequestDto) {
	//
	// 	// 이미 가입된 회원인지 검증
	// 	if (userRepository.existsByUserEmail(signupRequestDto.getUserEmail())) {
	// 		throw new UserAlreadyExistsException();
	// 	}
	//
	// 	// 이미 동일한 번호로 가입된 아이디가 있는지 검증
	// 	//        if (userRepository.findByPhoneNumber(phoneNumber).isPresent()) {
	// 	//            throw new PhoneAlreadyExistsException();
	// 	//        }
	//
	// 	User user = User.builder()
	// 		.userNickname(signupRequestDto.getUserNickname())
	// 		.userPassword(bCryptPasswordEncoder.encode(signupRequestDto.getUserPassword()))
	// 		.userIntroduction(signupRequestDto.getUserIntroduction())
	// 		.userRole(UserRole.USER)
	// 		.build();
	//
	// 	User save = userRepository.save(user);
	//
	// 	followService.followUser(save.getUserId(), 1L);
	//
	// 	// 캐시에 저장
	// 	UserDto userDto = UserDto.toEntity(user);
	//
	// 	return userDto;
	// }

	// @Transactional
	// public JwtTokenDto login(String userEmail, String userPassword) {
	// 	log.info("AuthService의 login() - userEmail : " + userEmail);
	//
	// 	User user = userRepository.findOneByUserEmail(userEmail).orElseThrow(UserNotFoundException::new);
	//
	// 	log.info("AuthService의 login() - user.userId: " + user.getUserId());
	// 	log.info("AuthService의 login() - user.userId toString(): " + String.valueOf(user.getUserId()));
	//
	// 	authTokenProvider.createAuthToken(String.valueOf(user.getUserId()), user.getUserRole(), new Date(now.getTime() + appProperties.getAuth().getTokenExpiry())
	// 	JwtToken jwtToken = jwtTokenProvider.createJwtToken(String.valueOf(user.getUserId()));
	//
	// 	Optional<UserRefreshToken> refreshTokenOptional = userRefreshTokenRepository.findOneByUserId(user.getUserId());
	//
	// 	log.info("refreshTokenOptional 찾아보기 ");
	//
	// 	if (refreshTokenOptional.isPresent()) { //이미 존재하면
	// 		log.info("refreshToken 업데이트 시작");
	//
	// 		refreshTokenOptional.get().updateToken(jwtToken.getRefreshToken()); //refresh token 업데이트
	// 		log.info("refreshToken 업데이트");
	// 	} else { //없으면
	// 		log.info("refreshToken 생성 시작");
	//
	// 		UserRefreshToken refreshToken = UserRefreshToken.builder()
	// 			.userId(user.getUserId())
	// 			.refreshToken(jwtToken.getRefreshToken())
	// 			.build();
	// 		userRefreshTokenRepository.save(refreshToken);
	// 		log.info("refreshToken 생성");
	// 	}
	//
	// 	return JwtTokenDto.builder()
	// 		.accessToken(jwtToken.getAccessToken())
	// 		.refreshToken(jwtToken.getRefreshToken())
	// 		.userId(user.getUserId())
	// 		.userEmail(user.getUserEmail())
	// 		.nickname(user.getUserNickname())
	// 		.build();
	// }

	// @Transactional
	// public void logout(String accessToken) throws RefreshTokenNotFoundException {
	// 	AuthToken authToken = authTokenProvider.convertAuthToken(accessToken);
	//
	// 	if (userRefreshTokenRepository.deleteByUserId(authToken.getUserId()) <= 0) {
	// 		throw new RefreshTokenNotFoundException();
	// 	}
	// }

}
