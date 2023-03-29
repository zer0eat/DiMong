package com.ssafy.dimong_be.application;

import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.interfaces.common.MypageDto;

public interface UserService {

	public User getUserInfo(Long userId);

	public MypageDto getMypageInfo(Long userId);

}
