// package com.ssafy.dimong_be.auth.service;
//
// import java.util.Optional;
//
// import org.springframework.security.authentication.InternalAuthenticationServiceException;
// import org.springframework.security.core.Authentication;
// import org.springframework.security.core.AuthenticationException;
// import org.springframework.security.core.context.SecurityContext;
// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
// import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
// import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
// import org.springframework.security.oauth2.core.user.OAuth2User;
// import org.springframework.stereotype.Service;
//
// import com.ssafy.dimong_be.application.exception.ErrorCode;
// import com.ssafy.dimong_be.auth.config.auth.UserPrincipal;
// import com.ssafy.dimong_be.auth.config.oauthUserInfo.OAuth2UserInfoFactory;
// import com.ssafy.dimong_be.auth.config.oauthUserInfo.provider.GithubOAuth2UserInfo;
// import com.ssafy.dimong_be.auth.config.oauthUserInfo.provider.OAuth2UserInfo;
// import com.ssafy.dimong_be.auth.exception.OAuthUserAlreadyExistException;
// import com.ssafy.dimong_be.domain.model.user.ProviderType;
// import com.ssafy.dimong_be.domain.model.user.UserRepository;
// import com.ssafy.dimong_be.domain.model.user.UserRole;
//
// import lombok.RequiredArgsConstructor;
// import lombok.extern.slf4j.Slf4j;
//
// @Service
// @RequiredArgsConstructor
// @Slf4j
// public class CustomOAuth2UserService extends DefaultOAuth2UserService {
//
// 	private final BCryptPasswordEncoder bCryptPasswordEncoder;
// 	private final UserRepository userRepository;
// 	// private final Authentication authentication; //SecurityContextHolder에 의해 SecurityContext에 Thread-local하게 저장되어 있음
//
// 	/*
// 	 * Returns an OAuth2User after obtaining the user attributes of the End-User from the UserInfo Endpoint.
// 	 */
// 	@Override
// 	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
// 		OAuth2User user = super.loadUser(userRequest);
//
// 		////////////////////////
// 		log.info(CustomOAuth2UserService.class + "- loadUser 의 userRequest: " + userRequest);
// 		log.info("userRequest.getAccessToken : " + userRequest.getAccessToken());
// 		log.info("userRequest.getAccessToken.getTokenValue : " + userRequest.getAccessToken().getTokenValue());
// 		log.info("userRequest.getAccessToken.getExpiresAt : " + userRequest.getAccessToken().getExpiresAt());
// 		////////////////////////
//
// 		try {
// 			return this.process(userRequest, user);
// 		} catch (AuthenticationException ex) {
// 			throw ex;
// 		} catch (Exception ex) {
// 			ex.printStackTrace();
// 			throw new InternalAuthenticationServiceException(ex.getMessage(), ex.getCause());
// 		}
// 	}
//
// 	private OAuth2User process(OAuth2UserRequest userRequest, OAuth2User oAuthUser) throws
// 		OAuthUserAlreadyExistException {
//
// 		SecurityContext context = SecurityContextHolder.getContext();
// 		Authentication authentication = context.getAuthentication();
//
// 		User loginUser = null;
//
// 		///////////////
// 		System.out.println("userRequest.getClientRegistration : " + userRequest.getClientRegistration());
// 		System.out.println("userRequest.getAccessToken : " + userRequest.getAccessToken());
// 		System.out.println("userRequest.getAdditionalParameters : " + userRequest.getAdditionalParameters());
//
// 		System.out.println("oAuthUser.getAttributes" + oAuthUser.getAttributes());
// 		System.out.println("oAuthUser.getName" + oAuthUser.getName());
// 		System.out.println("oAuthUser.getAuthorities" + oAuthUser.getAuthorities());
// 		////////////////
//
// 		ProviderType providerType = ProviderType.valueOf(
// 			userRequest.getClientRegistration().getRegistrationId().toUpperCase());
//
// 		//provider에서 받아온 유저 정보를 OAuth2UserInfo에 담음
// 		OAuth2UserInfo oAuthUserInfo = OAuth2UserInfoFactory.getOAuth2UserInfo(providerType, oAuthUser.getAttributes());
//
// 		/////////////////
// 		System.out.println("oAuthUserInfo.attributes: " + oAuthUserInfo.getAttributes());
// 		System.out.println("oAuthUserInfo.Id: " + oAuthUserInfo.getId());
// 		System.out.println("oAuthUserInfo.Email: " + oAuthUserInfo.getEmail());
// 		System.out.println("oAuthUserInfo.Name: " + oAuthUserInfo.getName());
// 		System.out.println("oAuthUserInfo.ImageUrl: " + oAuthUserInfo.getImageUrl());
// 		//////////////////
//
// 		// //로그인 여부 확인
// 		// UserPrincipal principal = (UserPrincipal)authentication.getPrincipal();
//
// 		//OAuth 계정 있는지 확인
// 		boolean isOAuthUserExists = userRepository.existsByProviderTypeAndProviderId(providerType,
// 			oAuthUserInfo.getId());
//
// 		if (authentication != null) { //로그인 된 상태면
// 			log.info("로그인 된 상태");
//
// 			UserPrincipal principal = (UserPrincipal)authentication.getPrincipal();
//
// 			User localUser = userRepository.findOneByUserId(principal.getUserId())
// 				.orElseThrow(); //현재 로그인 된 사용자 정보로 DB 조회 (없으면 UserNotFoundException 발생)
//
// 			if (localUser.getProviderType() == null || localUser.getProviderId() == null) { //OAuth 연동이 안 된 로컬 계정일 때
// 				log.info("OAuth 연동이 안 된 로컬 계정");
//
// 				if (isOAuthUserExists) { //기존 OAuth 계정이 있었다면
// 					log.info("기존 OAuth 계정이 있었음 -> 예외");
// 					throw new OAuthUserAlreadyExistException("기존 OAuth 계정이 있었음",
// 						ErrorCode.GITHUB_USER_ALREADY_EXIST); //예외 발생
// 				} else { //기존 OAuth 계정이 없다면 (처음이면)
// 					log.info("기존 OAuth 계정이 없음 -> 연동");
//
// 					User newOAuthUser = localUser.toBuilder()
// 						.providerType(providerType)
// 						.providerId(oAuthUserInfo.getId())
// 						.providerEmail(oAuthUserInfo.getEmail())
// 						.providerAccessToken(userRequest.getAccessToken().getTokenValue())
// 						.build();
//
// 					if (String.valueOf(providerType)
// 						.equals(ProviderType.GITHUB.toString())) { //Provider가 Github이면 githubUrl 추가
// 						log.info("ProviderType.GITHUB 에 들어옴");
// 						GithubOAuth2UserInfo githubOAuth2UserInfo = (GithubOAuth2UserInfo)oAuthUserInfo;
//
// 						newOAuthUser.setGithubUrl(githubOAuth2UserInfo.getGithubUrl());
// 						newOAuthUser.setGithubLoginName(oAuthUserInfo.getName());
//
// 						log.info("oAuthUserInfo.getName() : " + oAuthUserInfo.getName());
// 						log.info("githubOAuth2UserInfo.getName() : " + githubOAuth2UserInfo.getName());
// 					}
//
// 					loginUser = userRepository.save(newOAuthUser);
// 				}
// 			} else {
// 				log.info("OAuth 연동이 된 로컬 계정");
// 				loginUser = localUser;
// 			}
// 		} else { //로그이 안 된 상태면
// 			log.info("로그인 안 된 상태");
//
// 			if (isOAuthUserExists) { //기존 OAuth 계정이 있었다면
// 				log.info("기존 OAuth 계정이 있었음 -> OAuth 로그인");
//
// 				//OAuth 로그인 성공. -> 토큰 발급
// 				loginUser = userRepository.findOneByProviderTypeAndProviderId(providerType, oAuthUserInfo.getId())
// 					.orElseThrow(() -> new OAuthUserAlreadyExistException("기존 OAuth 계정이 있었음",
// 						ErrorCode.GITHUB_USER_ALREADY_EXIST));
//
// 				loginUser.setProviderAccessToken(userRequest.getAccessToken().getTokenValue());
//
// 				userRepository.save(loginUser);
// 			} else { //기존 OAuth 계정이 없었다면 (기존 Local 회원일 수도, 아닐 수도 있음)
// 				Optional<User> localUserOptional = userRepository.findOneByUserEmail(oAuthUserInfo.getEmail());
//
// 				if (localUserOptional.isPresent()) { //기존 Local 회원이라면 -> 연동
// 					log.info("기존 OAuth 계정이 없었고, 기존 Local 계정은 있음 -> 강제 연동");
//
// 					User localUser = localUserOptional.get();
//
// 					User newOAuthUser = localUser.toBuilder()
// 						.providerType(providerType)
// 						.providerId(oAuthUserInfo.getId())
// 						.providerEmail(oAuthUserInfo.getEmail())
// 						.providerAccessToken(userRequest.getAccessToken().getTokenValue())
// 						.build();
//
// 					log.info(String.valueOf(providerType));
//
// 					if (String.valueOf(providerType)
// 						.equals(ProviderType.GITHUB.toString())) { //Provider가 Github이면 githubUrl 추가
// 						log.info("ProviderType.GITHUB 에 들어옴");
//
// 						GithubOAuth2UserInfo githubOAuth2UserInfo = (GithubOAuth2UserInfo)oAuthUserInfo;
//
// 						newOAuthUser.setGithubUrl(githubOAuth2UserInfo.getGithubUrl());
// 						newOAuthUser.setGithubLoginName(oAuthUserInfo.getName());
//
// 						log.info("oAuthUserInfo.getName() : " + oAuthUserInfo.getName());
// 						log.info("githubOAuth2UserInfo.getName() : " + githubOAuth2UserInfo.getName());
// 					}
//
// 					loginUser = userRepository.saveAndFlush(newOAuthUser);
// 				} else { //기존 Local 회원이 아니라면 -> 회원가입
// 					log.info("기존 OAuth 계정이 없었고, 기존 Local 계정도 없음 -> OAuth 회원가입");
//
// 					log.info("userId: " + oAuthUserInfo.getEmail());
// 					log.info("userEmail: " + oAuthUserInfo.getEmail());
//
// 					//OAuth 회원가입 성공. 로그인 성공. -> 토큰 발급
// 					User newOAuthUser = User.builder()
// 						.userEmail(oAuthUserInfo.getEmail())
// 						.userPassword(bCryptPasswordEncoder.encode(
// 							providerType + oAuthUserInfo.getId())) //providerType + oAuth ID로 패스워드 강제 입력
// 						.userRole(UserRole.USER)
// 						.userNickname(oAuthUserInfo.getName())
// 						.providerType(providerType)
// 						.providerId(oAuthUserInfo.getId())
// 						.providerEmail(oAuthUserInfo.getEmail())
// 						.providerAccessToken(userRequest.getAccessToken().getTokenValue())
// 						.build();
//
// 					if (String.valueOf(providerType)
// 						.equals(ProviderType.GITHUB.toString())) { //Provider가 Github이면 githubUrl 추가
// 						log.info("ProviderType.GITHUB 에 들어옴");
//
// 						GithubOAuth2UserInfo githubOAuth2UserInfo = (GithubOAuth2UserInfo)oAuthUserInfo;
//
// 						newOAuthUser.setUserProfileImage(githubOAuth2UserInfo.getImageUrl());
// 						newOAuthUser.setGithubUrl(githubOAuth2UserInfo.getGithubUrl());
// 						newOAuthUser.setGithubLoginName(oAuthUserInfo.getName());
//
// 						log.info("oAuthUserInfo.getName() : " + oAuthUserInfo.getName());
// 						log.info("githubOAuth2UserInfo.getName() : " + githubOAuth2UserInfo.getName());
// 					}
//
// 					loginUser = userRepository.save(newOAuthUser);
// 				}
// 			}
// 		}
//
// 		return UserPrincipal.create(loginUser, oAuthUser.getAttributes());
// 	}
//
// 	// private User createUser(OAuth2UserInfo userInfo, ProviderType providerType) {
// 	// 	User user = User.builder()
// 	// 		.userNickname(userInfo.getId())
// 	// 		// .userNickname(userInfo.getName())
// 	// 		.userEmail(userInfo.getEmail())
// 	// 		.userProfileImage(userInfo.getImageUrl())
// 	// 		.providerType(providerType)
// 	// 		.userRole(UserRole.USER)
// 	// 		.build();
// 	//
// 	// 	return userRepository.saveAndFlush(user);
// 	// }
// 	//
// 	// private User updateUser(User user, OAuth2UserInfo userInfo) {
// 	// 	if (userInfo.getImageUrl() != null && !user.getUserProfileImage().equals(userInfo.getImageUrl())) {
// 	// 		user.toBuilder()
// 	// 			.userProfileImage(userInfo.getImageUrl());
// 	// 	}
// 	//
// 	// 	return user;
// 	// }
// }
