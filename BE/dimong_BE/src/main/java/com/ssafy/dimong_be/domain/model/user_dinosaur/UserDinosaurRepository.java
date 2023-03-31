package com.ssafy.dimong_be.domain.model.user_dinosaur;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDinosaurRepository extends JpaRepository<UserDinosaur, Long> {

	// @Query("SELECT d, ud.userId "
	// 	+ "FROM Dinosaur d "
	// 	+ "LEFT JOIN UserDinosaur ud "
	// 	+ "ON d.dinosaurId = ud.dinosaurId "
	// 	+ "WHERE ud.userId = :userId")
	// List<UserDinosaur> findAllByUser_UserId(Long userId);

}
