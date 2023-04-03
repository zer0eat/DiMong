package com.ssafy.dimong_be.domain.model.user_badge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserBadgeRepository extends JpaRepository<UserBadge, Long> {

	List<UserBadge> findAllByUser_UserId(Long userId);

	// boolean existsByUserIdAndBadge_DinosaurId(Long userId, Long dinosaurId);

	boolean existsByUserIdAndBadge_BadgeId(Long userId, Long badgeId);

}
