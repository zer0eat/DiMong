package com.ssafy.dimong_be.application.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.DinosaurService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurRepository;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurResponseDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class DinosaurServiceImpl implements DinosaurService {

	private final DinosaurRepository dinosaurRepository;

	@Override
	public List<DinosaurResponseDto> getDinosaurList(String geologicAge) {
		List<Dinosaur> dinosaurList = dinosaurRepository.findAllByGeologicAge(geologicAge);

		List<DinosaurResponseDto> dinosaurDtoList = new ArrayList<>();
		dinosaurList.forEach(dinosaur -> dinosaurDtoList.add(DinosaurResponseDto.fromEntity(dinosaur)));

		return dinosaurDtoList;
	}

	@Override
	public Dinosaur getDinosaur(Long dinosaurId) {
		return dinosaurRepository.findByDinosaurId(dinosaurId)
			.orElseThrow(
				() -> new EntityNotFoundException(
					"dinosaurId (" + dinosaurId + ") 에 해당하는 공룡이 없음.",
					ErrorCode.DINOSAUR_ENTITY_NOT_FOUND
				)
			);
	}

	@Override
	public Object getDinosaurAudio(Long dinosaurId) {
		return null;
	}

}
