package com.ssafy.dimong_be.domain.model.badge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserBadgeReposiroty extends JpaRepository<UserBadge, Long> {

	List<UserBadge> findAllByUser_UserId(Long userId);

}
