package com.ssafy.dimong_be.application.impl;

import java.util.Optional;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.ssafy.dimong_be.application.TtsService;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurRepository;
import com.ssafy.dimong_be.interfaces.tts.TtsResponseDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TtsServiceImpl implements TtsService {

	private final DinosaurRepository dinosaurRepository;

	@Override
	public TtsResponseDto getAudioSrc(Long dinosaurId) {
		Optional<Dinosaur> dinosaurOptional = dinosaurRepository.findByDinosaurId(dinosaurId);

		if(dinosaurOptional.isPresent()){
			Dinosaur dinosaur =dinosaurOptional.get();

			Random random = new Random();
			int randomInt = random.nextInt(3);

			String dir = "https://j8a105.p.ssafy.io//static/story/";
			String audioUrl = dir + dinosaur.getDinosaurName() + randomInt + ".mp3";
			return TtsResponseDto.builder().id(dinosaurId).audioUrl(audioUrl).build();

		} else {
			return TtsResponseDto.builder().id(dinosaurId).audioUrl("wrong id").build();
		}
	}

}
