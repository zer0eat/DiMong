package com.ssafy.dimong_be.domain.model.drwaing;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DrawingRepository extends JpaRepository<Drawing, Long> {

	List<Drawing> findAllByUser_UserId(Long userId);

}
