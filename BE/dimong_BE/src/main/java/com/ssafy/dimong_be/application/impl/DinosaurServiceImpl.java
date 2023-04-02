package com.ssafy.dimong_be.application.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.AIService;
import com.ssafy.dimong_be.application.DinosaurService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurQueryRepository;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurRepository;
import com.ssafy.dimong_be.domain.model.user_dinosaur.UserDinosaur;
import com.ssafy.dimong_be.domain.model.user_dinosaur.UserDinosaurRepository;
import com.ssafy.dimong_be.infrastructure.http.DinosaurNameDto;
import com.ssafy.dimong_be.interfaces.common.FileDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurListResponseDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurRecommendationResponseDto;
import com.ssafy.dimong_be.interfaces.dinosaur.DinosaurResponseDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class DinosaurServiceImpl implements DinosaurService {

	private final DinosaurRepository dinosaurRepository;
	private final UserDinosaurRepository userDinosaurRepository;
	private final DinosaurQueryRepository dinosaurQueryRepository;

	private final AIService httpAIService;

	@Override
	public List<DinosaurListResponseDto> getDinosaurList(String geologicAge) {
		List<Dinosaur> dinosaurList = dinosaurRepository.findAllByGeologicAge(geologicAge);

		List<DinosaurListResponseDto> dinosaurDtoList = new ArrayList<>();
		dinosaurList.forEach(dinosaur -> dinosaurDtoList.add(DinosaurListResponseDto.fromEntity(dinosaur)));

		return dinosaurDtoList;
	}

	@Override
	public List<DinosaurListResponseDto> getDinosaurList() {
		List<Dinosaur> dinosaurList = dinosaurRepository.findAll();

		List<DinosaurListResponseDto> dinosaurDtoList = new ArrayList<>();
		dinosaurList.forEach(dinosaur -> dinosaurDtoList.add(DinosaurListResponseDto.fromEntity(dinosaur)));

		return dinosaurDtoList;
	}

	@Override
	public List<DinosaurListResponseDto> getDinosaurList(Long userId) {
		List<Dinosaur> dinosaurList = dinosaurQueryRepository.findAllByUserDinosaur_UserId(userId);
		// 	.stream()
		// 	.map(DinosaurListResponseDto::new)
		// 	.collect(Collectors.toList());

		List<DinosaurListResponseDto> dinosaurDtoList = new ArrayList<>();
		dinosaurList.forEach(dinosaur -> dinosaurDtoList.add(DinosaurListResponseDto.fromEntity(dinosaur)));

		return dinosaurDtoList;
	}

	@Override
	public DinosaurResponseDto getDinosaur(Long dinosaurId) {
		Dinosaur dinosaur = dinosaurRepository.findByDinosaurId(dinosaurId)
			.orElseThrow(
				() -> new EntityNotFoundException(
					"dinosaurId (" + dinosaurId + ") 에 해당하는 공룡이 없음.",
					ErrorCode.DINOSAUR_ENTITY_NOT_FOUND
				)
			);

		return DinosaurResponseDto.fromEntity(dinosaur);
	}

	@Override
	public DinosaurRecommendationResponseDto getDinosaur(FileDto fileDto) {
		DinosaurNameDto dinosaurNameDto = httpAIService.getRecommendedDinosaurName(fileDto);

		log.info("isFound: " + dinosaurNameDto.isFound());
		log.info("dinosaurName: " + dinosaurNameDto.getDinosaurName());

		if (!dinosaurNameDto.isFound()) { //공룡이 아니면
			return DinosaurRecommendationResponseDto.builder()
				.isFound(false)
				.dinosaurId(-1L)
				.dinosaurName("")
				.dinosaurImageUrl("")
				.build();
		} else { //공룡이면
			String dinosaurName = dinosaurNameDto.getDinosaurName();

			//공룡 이름에 해당하는 Entity 찾기
			Dinosaur dinosaur = dinosaurRepository.findByDinosaurNameLike(dinosaurName)
				.orElseThrow(() -> new EntityNotFoundException(dinosaurName + "이라는 이름을 가진 공룡이 없습니다.",
					ErrorCode.DINOSAUR_ENTITY_NOT_FOUND));

			//User가 해당 공룡을 찾았다는 정보 저장
			Long userId = fileDto.getUserId();
			Long dinosaurId = dinosaur.getDinosaurId();

			if (!userDinosaurRepository.existsByUserIdAndDinosaurId(userId, dinosaurId)) {
				userDinosaurRepository.save(UserDinosaur.builder()
					.userId(userId)
					.dinosaurId(dinosaurId)
					.build()
				);
			}

			DinosaurRecommendationResponseDto responseDto = DinosaurRecommendationResponseDto.fromEntity(dinosaur);
			responseDto.setFound(true);

			return responseDto;
		}
	}

	@Override
	public List<DinosaurRecommendationResponseDto> getDinosaurList(FileDto fileDto) {
		// DinosaurNameListDto dinosaurNameListDto = httpAIService.getRecommendedDinosaurNameList(fileDto);
		//
		// List
		//
		// if (!dinosaurNameListDto.isFound()) { //공룡이 아니면
		// 	return DinosaurRecommendationResponseDto.builder()
		// 		.isFound(false)
		// 		.dinosaurId(-1L)
		// 		.dinosaurName("")
		// 		.dinosaurImageUrl("")
		// 		.build();
		// } else { //공룡이면
		// 	String dinosaurName = dinosaurNameDto.getDinosaurName();
		//
		// 	Dinosaur dinosaur = dinosaurRepository.findByDinosaurNameLike(dinosaurName)
		// 		.orElseThrow(() -> new EntityNotFoundException(dinosaurName + "이라는 이름을 가진 공룡이 없습니다.",
		// 			ErrorCode.DINOSAUR_ENTITY_NOT_FOUND));
		//
		// 	DinosaurRecommendationResponseDto responseDto = DinosaurRecommendationResponseDto.fromEntity(dinosaur);
		// 	responseDto.setFound(true);
		//
		// 	return responseDto;
		// }
		return null;
	}

	@Override
	public Object getDinosaurAudio(Long dinosaurId) {
		return null;
	}

}
