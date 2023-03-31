package com.ssafy.dimong_be.domain.model.user_badge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserBadgeRepository extends JpaRepository<UserBadge, Long> {

	List<UserBadge> findAllByUser_UserId(Long userId);

}
