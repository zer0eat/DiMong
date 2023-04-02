package com.ssafy.dimong_be.application.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.AIService;
import com.ssafy.dimong_be.application.DinosaurService;
import com.ssafy.dimong_be.application.exception.ErrorCode;
import com.ssafy.dimong_be.application.exception.business.EntityNotFoundException;
import com.ssafy.dimong_be.domain.model.badge.Badge;
import com.ssafy.dimong_be.domain.model.badge.BadgeRepository;
import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurQueryRepository;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurRepository;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadge;
import com.ssafy.dimong_be.domain.model.user_badge.UserBadgeRepository;
import com.ssafy.dimong_be.domain.model.user_dinosaur.UserDinosaur;
import com.ssafy.dimong_be.domain.model.user_dinosaur.UserDinosaurRepository;
import com.ssafy.dimong_be.infrastructure.http.DinosaurNameDto;
import com.ssafy.dimong_be.infrastructure.http.DinosaurNameListDto;
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
	private final UserBadgeRepository userBadgeRepository;
	private final BadgeRepository badgeRepository;

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
		DinosaurNameDto dinosaurNameDto = httpAIService.getRecommendedDinosaurName(fileDto.getFile());

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
			Dinosaur dinosaur = dinosaurRepository.findByDinosaurName(dinosaurName)
				.orElseThrow(() -> new EntityNotFoundException(dinosaurName + "이라는 이름을 가진 공룡이 없습니다.",
					ErrorCode.DINOSAUR_ENTITY_NOT_FOUND));

			//User가 해당 공룡 도감 획득
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
		DinosaurNameListDto dinosaurNameListDto = httpAIService.getRecommendedDinosaurNameList(fileDto.getFile());

		log.info("isFound: " + dinosaurNameListDto.isFound());
		log.info("dinosaurName1: " + dinosaurNameListDto.getDinosaurName1());
		log.info("dinosaurName2: " + dinosaurNameListDto.getDinosaurName2());
		log.info("dinosaurName3: " + dinosaurNameListDto.getDinosaurName3());

		if (!dinosaurNameListDto.isFound()) { //공룡이 아니면
			return Collections.emptyList();
		} else { //공룡이면
			String dinosaurName1 = dinosaurNameListDto.getDinosaurName1();
			String dinosaurName2 = dinosaurNameListDto.getDinosaurName2();
			String dinosaurName3 = dinosaurNameListDto.getDinosaurName3();

			//공룡 이름에 해당하는 Entity 찾기
			List<Dinosaur> dinosaurList = dinosaurRepository.findByDinosaurNames(dinosaurName1, dinosaurName2, dinosaurName3);
			if (dinosaurList.size() != 3) {
				throw new EntityNotFoundException("3가지 공룡을 모두 찾지 못했습니다.",
					ErrorCode.DINOSAUR_ENTITY_NOT_FOUND);
			}

			//User가 해당 공룡에 대한 뱃지를 획득
			Long userId = fileDto.getUserId();

			Dinosaur mostSimilarDinosaur = dinosaurRepository.findByDinosaurName(dinosaurName1)
				.orElseThrow(() -> new EntityNotFoundException(dinosaurName1 + "이라는 이름을 가진 공룡이 없습니다.",
					ErrorCode.DINOSAUR_ENTITY_NOT_FOUND));
			Long dinosaurId = mostSimilarDinosaur.getDinosaurId();


			Badge badge = badgeRepository.findByDinosaurId(dinosaurId)
				.orElseThrow(() -> new EntityNotFoundException(
					"dinosaurId(" + dinosaurId + ")에 해당하는 뱃지가 없습니다.", ErrorCode.ENTITY_NOT_FOUND));

			if (!userBadgeRepository.existsByUserIdAndBadge_BadgeId(userId, badge.getBadgeId())) {
				userBadgeRepository.save(UserBadge.builder()
					.userId(userId)
					.badge(badge)
					.build()
				);
			}

			List<DinosaurRecommendationResponseDto> dinosaurRecommendationResponseDtoList = new ArrayList<>();
			dinosaurList.forEach(dinosaur -> dinosaurRecommendationResponseDtoList.add(
				DinosaurRecommendationResponseDto.fromEntity(dinosaur)
			));

			return dinosaurRecommendationResponseDtoList;
		}
	}

	@Override
	public Object getDinosaurAudio(Long dinosaurId) {
		return null;
	}

}
