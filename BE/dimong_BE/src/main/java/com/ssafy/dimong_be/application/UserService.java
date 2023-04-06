package com.ssafy.dimong_be.application;

import com.ssafy.dimong_be.auth.userInfo.OAuth2UserInfo;
import com.ssafy.dimong_be.domain.model.user.ProviderType;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.interfaces.mypage.MypageResponseDto;
import com.ssafy.dimong_be.interfaces.user.AuthResponseDto;
import com.ssafy.dimong_be.interfaces.user.OAuthProviderDto;
import com.ssafy.dimong_be.interfaces.user.SignupRequestDto;

public interface UserService {

	User getUserInfo(Long userId);

	MypageResponseDto getMypageInfo(Long userId);

	AuthResponseDto signup(OAuth2UserInfo userInfo, ProviderType providerType);

	// AuthResponseDto login(OAuthProviderDto oAuthProviderDto);

	AuthResponseDto login(OAuth2UserInfo userInfo, ProviderType providerType);

}
