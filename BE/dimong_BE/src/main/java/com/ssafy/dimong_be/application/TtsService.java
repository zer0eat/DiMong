package com.ssafy.dimong_be.application;

import org.springframework.stereotype.Service;

import com.ssafy.dimong_be.interfaces.tts.TtsResponseDto;

@Service
public interface TtsService {

	TtsResponseDto getAudioSrc(Long dinosaurId);
}
