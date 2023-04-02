package com.ssafy.dimong_be.application;

import com.ssafy.dimong_be.infrastructure.http.DinosaurNameDto;
import com.ssafy.dimong_be.infrastructure.http.DinosaurNameListDto;
import com.ssafy.dimong_be.interfaces.common.FileDto;

public interface AIService {

	public DinosaurNameDto getRecommendedDinosaurName(FileDto fileDto);

	public DinosaurNameListDto getRecommendedDinosaurNameList(FileDto fileDto);

}
