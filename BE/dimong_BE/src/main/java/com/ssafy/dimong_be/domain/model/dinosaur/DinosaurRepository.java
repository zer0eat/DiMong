package com.ssafy.dimong_be.domain.model.dinosaur;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DinosaurRepository extends JpaRepository<Dinosaur, Long> {

	Optional<Dinosaur> findByDinosaurId(Long dinosaurId);

	List<Dinosaur> findAllByGeologicAge(String geologicAge);

}
