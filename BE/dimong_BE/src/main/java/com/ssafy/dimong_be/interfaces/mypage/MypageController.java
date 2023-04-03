package com.ssafy.dimong_be.interfaces.mypage;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dimong_be.application.BadgeService;
import com.ssafy.dimong_be.application.DrawingService;
import com.ssafy.dimong_be.application.UserService;
import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.interfaces.common.MypageResponseDto;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class MypageController {

	private final UserService userService;
	private final DrawingService drawingService;
	private final BadgeService badgeService;

	@GetMapping("/v1/mypage/{userId}")
	public ResponseEntity<MypageResponseDto> getMypageInfo(@PathVariable Long userId) {
		return ResponseEntity.ok(userService.getMypageInfo(userId));
	}

	@GetMapping("/v1/mypage/{userId}/drawings")
	public ResponseEntity<List<Drawing>> getMypageDrawingList(@PathVariable Long userId) {
		return ResponseEntity.ok(drawingService.getDrawingList(userId));
	}

	@GetMapping("/v1/badges/{userId}")
	public ResponseEntity getBadgeList(@PathVariable Long userId) {
		return ResponseEntity.ok(badgeService.getBadgeList(userId));
	}

}
