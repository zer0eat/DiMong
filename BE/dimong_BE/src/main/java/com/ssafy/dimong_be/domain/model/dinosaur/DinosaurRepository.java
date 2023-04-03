package com.ssafy.dimong_be.domain.model.dinosaur;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DinosaurRepository extends JpaRepository<Dinosaur, Long> {

	Optional<Dinosaur> findByDinosaurId(Long dinosaurId);

	List<Dinosaur> findAllByGeologicAge(String geologicAge);

	Optional<Dinosaur> findByDinosaurName(String dinosaurName);

	@Query("SELECT d "
		+ "FROM Dinosaur d "
		+ "WHERE d.dinosaurName like :dinosaurName1 "
		+ "OR d.dinosaurName like :dinosaurName2 "
		+ "OR d.dinosaurName like :dinosaurName3")
	List<Dinosaur> findByDinosaurNames(
		@Param("dinosaurName1") String dinosaurName1,
		@Param("dinosaurName2") String dinosaurName2,
		@Param("dinosaurName3") String dinosaurName3
	);

}
