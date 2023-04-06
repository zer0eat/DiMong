package com.ssafy.dimong_be.domain.model.drawing;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DrawingRepository extends JpaRepository<Drawing, Long> {

	List<Drawing> findAllByUser_UserId(Long userId);

	@Query("SELECT d, dino1 AS similarDinosaur1, dino2 AS similarDinosaur2, dino3 AS similarDinosaur3 "
		+ "FROM Drawing d "
		+ "INNER JOIN FETCH Dinosaur dino1 ON d.similarDinosaurId1 = dino1.dinosaurId "
		+ "INNER JOIN FETCH Dinosaur dino2 ON d.similarDinosaurId2 = dino2.dinosaurId "
		+ "INNER JOIN FETCH Dinosaur dino3 ON d.similarDinosaurId3 = dino3.dinosaurId "
		+ "WHERE d.drawingId = :drawingId")
	Optional<Drawing> findByIdWithJpql(@Param("drawingId") Long drawingId);



}
