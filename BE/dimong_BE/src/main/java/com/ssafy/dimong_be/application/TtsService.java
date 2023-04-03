package com.ssafy.dimong_be.application;

import com.ssafy.dimong_be.interfaces.tts.TtsResponseDto;

public interface TtsService {

	TtsResponseDto getAudioSrc(Long dinosaurId);

}
