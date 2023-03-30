package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurListResponseDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurResponseDto;

public interface DinosaurService {

	public List<DinosaurListResponseDto> getDinosaurList(String geologicAge);

	public List<DinosaurListResponseDto> getDinosaurList();

	DinosaurResponseDto getDinosaur(Long dinosaurId);

	Object getDinosaurAudio(Long dinosaurId);

}
