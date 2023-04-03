package com.ssafy.dimong_be.application;

import com.ssafy.dimong_be.interfaces.common.UserBadgeDto;

public interface BadgeService {

	UserBadgeDto getBadgeList(Long userId);
	Long getBadgeIdByDinosaurId(Long dinosaurId);

}
