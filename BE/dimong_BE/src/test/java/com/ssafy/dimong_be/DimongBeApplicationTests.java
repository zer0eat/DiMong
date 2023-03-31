package com.ssafy.dimong_be;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.ssafy.dimong_be.domain.model.dinosaur.Dinosaur;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurQueryRepository;
import com.ssafy.dimong_be.domain.model.dinosaur.DinosaurRepository;
import com.ssafy.dimong_be.domain.model.user_dinosaur.UserDinosaurRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
class DimongBeApplicationTests {

	@Autowired
	private UserDinosaurRepository userDinosaurRepository;

	@Autowired
	private DinosaurRepository dinosaurRepository;

	@Autowired
	private DinosaurQueryRepository dinosaurQueryRepository;

	@Test
	void contextLoads() {
	}

	@Test
	@DisplayName("JPQL을 이용한 UserDinosaur List 조회 테스트")
	public void findByUserIdWithJpql() {
		// StringBuilder sb = new StringBuilder();
		//
		// List<DinosaurListResponseDto> dinosaurList = dinosaurQueryRepository.findAllByUserDinosaur_UserId(1L)
		// 	.stream()
		// 	.map(DinosaurListResponseDto::new)
		// 	.collect(Collectors.toList());
		//
		// dinosaurList.forEach(dinosaur -> {
		//
		// 	System.out.println("dinosaurId: " + dinosaur.getDinosaurId() + ", dinosaurName: " + dinosaur.getDinosaurName() + "isCollected: ");
		// 	System.out.println();
		//
		// });

		StringBuilder sb = new StringBuilder();

		List<Dinosaur> dinosaurList = dinosaurQueryRepository.findAllByUserDinosaur_UserId(1L);

		dinosaurList.forEach(dinosaur -> {

			System.out.println("dinosaurId: " + dinosaur.getDinosaurId() + ", dinosaurName: " + dinosaur.getDinosaurName() + ", isCollected: " + dinosaur.isCollected());
			System.out.println();

		});
	}

}
