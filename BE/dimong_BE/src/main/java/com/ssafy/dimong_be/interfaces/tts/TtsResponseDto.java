package com.ssafy.dimong_be.interfaces.tts;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TtsResponseDto {
	Long id;
	String audioUrl;
}
