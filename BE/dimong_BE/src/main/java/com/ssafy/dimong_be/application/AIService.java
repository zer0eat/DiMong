package com.ssafy.dimong_be.application;

import org.springframework.web.multipart.MultipartFile;

import com.ssafy.dimong_be.infrastructure.http.DinosaurNameDto;
import com.ssafy.dimong_be.infrastructure.http.DinosaurNameListDto;

public interface AIService {

	public DinosaurNameDto getRecommendedDinosaurName(MultipartFile file);

	public DinosaurNameListDto getRecommendedDinosaurNameList(MultipartFile file);

}
