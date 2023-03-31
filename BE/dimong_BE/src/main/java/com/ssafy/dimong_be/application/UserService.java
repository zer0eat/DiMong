package com.ssafy.dimong_be.application;

import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.interfaces.common.MypageResponseDto;

public interface UserService {

	User getUserInfo(Long userId);

	MypageResponseDto getMypageInfo(Long userId);

}
