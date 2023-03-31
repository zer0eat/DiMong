package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurListResponseDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurResponseDto;

public interface DinosaurService {

	List<DinosaurListResponseDto> getDinosaurList(String geologicAge);

	List<DinosaurListResponseDto> getDinosaurList();

	List<DinosaurListResponseDto> getDinosaurList(Long userId);

	DinosaurResponseDto getDinosaur(Long dinosaurId);

	Object getDinosaurAudio(Long dinosaurId);

}
