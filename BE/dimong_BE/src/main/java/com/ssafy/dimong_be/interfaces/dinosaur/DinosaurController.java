package com.ssafy.dimong_be.interfaces.dinosaur;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dimong_be.application.DinosaurService;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class DinosaurController {

	private final DinosaurService dinosaurservice;

	@GetMapping("/v1/dinosaurs")
	public ResponseEntity<List<Dinosaur>> getDinosaurList(@RequestParam String period) {
		return ResponseEntity.ok(dinosaurservice.getDinosaurList(period));
	}

	@GetMapping("/v1/dinosaurs/{dinosaurId}")
	public ResponseEntity<Dinosaur> getDinosaur(@PathVariable Long dinosaurId) {
		return ResponseEntity.ok(dinosaurservice.getDinosaur(dinosaurId));
	}

	@GetMapping("/v1/dinosaurs/audio/{dinosaurId}")
	public ResponseEntity getDinosaurAudio(@PathVariable Long dinosaurId) {
		return ResponseEntity.ok(dinosaurservice.getDinosaurAudio(dinosaurId));
	}

}
