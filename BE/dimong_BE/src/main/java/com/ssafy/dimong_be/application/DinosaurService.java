package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.interfaces.common.FileDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurListResponseDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurResponseDto;

public interface DinosaurService {

	List<DinosaurListResponseDto> getDinosaurList(String geologicAge);

	List<DinosaurListResponseDto> getDinosaurList();

	List<DinosaurListResponseDto> getDinosaurList(Long userId);

	DinosaurResponseDto getDinosaur(Long dinosaurId);

	DinosaurRecommendationResponseDto getDinosaur(FileDto fileDto);

	List<DinosaurRecommendationResponseDto> getDinosaurList(FileDto fileDto);

	Object getDinosaurAudio(Long dinosaurId);

}
