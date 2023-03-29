package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;

public interface DinosaurService {

	public List<Dinosaur> getDinosaurList(String geologicAge);

	Dinosaur getDinosaur(Long dinosaurId);

	Object getDinosaurAudio(Long dinosaurId);
}
