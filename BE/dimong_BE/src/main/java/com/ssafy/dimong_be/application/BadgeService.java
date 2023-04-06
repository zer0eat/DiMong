package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.interfaces.mypage.BadgeResponseDto;

public interface BadgeService {

	List<BadgeResponseDto> getBadgeList(Long userId);

	Long getBadgeIdByDinosaurId(Long dinosaurId);

}
