package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurResponseDto;

public interface DinosaurService {

	public List<DinosaurResponseDto> getDinosaurList(String geologicAge);

	Dinosaur getDinosaur(Long dinosaurId);

	Object getDinosaurAudio(Long dinosaurId);
}
