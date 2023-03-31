package com.ssafy.dimong_be.interfaces.dinosaur;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dimong_be.application.DinosaurService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class DinosaurController {

	private final DinosaurService dinosaurservice;

	/*
	공룡 목록 조회 - filter: 지질 시대
	 */
	@GetMapping("/v2/dinosaurs")
	public ResponseEntity<List<DinosaurListResponseDto>> getDinosaurList(@RequestParam String period) {
		return ResponseEntity.ok(dinosaurservice.getDinosaurList(period));
	}

	/*
	전체 공룡 목록 조회
	 */
	@GetMapping("/v3/dinosaurs")
	public ResponseEntity<List<DinosaurListResponseDto>> getDinosaurList() {
		return ResponseEntity.ok(dinosaurservice.getDinosaurList());
	}

	/*
	전체 공룡 목록 조회 - filter: 사용자가 찾은 공룡
	 */
	@GetMapping("/v4/dinosaurs")
	public ResponseEntity<List<DinosaurListResponseDto>> getDinosaurList(@RequestParam Long userId) {
		return ResponseEntity.ok(dinosaurservice.getDinosaurList(userId));
	}

	@GetMapping("/v2/dinosaurs/{dinosaurId}")
	public ResponseEntity<DinosaurResponseDto> getDinosaur(@PathVariable Long dinosaurId) {
		return ResponseEntity.ok(dinosaurservice.getDinosaur(dinosaurId));
	}

	@GetMapping("/v1/dinosaurs/audio/{dinosaurId}")
	public ResponseEntity getDinosaurAudio(@PathVariable Long dinosaurId) {
		return ResponseEntity.ok(dinosaurservice.getDinosaurAudio(dinosaurId));
	}

}
