package com.ssafy.dimong_be.interfaces.tts;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dimong_be.application.impl.TtsServiceImpl;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class TtsController {
	private final TtsServiceImpl ttsService;
	@GetMapping("/api/v1/dinosaurs/story/{dinosaurId}")
	public ResponseEntity<TtsResponseDto> getMypageInfo(@PathVariable Long dinosaurId) {
		return ResponseEntity.ok(ttsService.getAudioSrc(dinosaurId));
	}
}
