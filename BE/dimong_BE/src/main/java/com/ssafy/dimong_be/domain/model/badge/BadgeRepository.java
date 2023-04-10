package com.ssafy.dimong_be.domain.model.badge;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BadgeRepository extends JpaRepository<Badge, Long> {

	Optional<Badge> findByDinosaurId(Long dinosaurId);

	// @Query("SELECT b, nullif(ub.userId, 0) AS isCollected, ub.createdAt "
	// 	+ "FROM Badge b "
	// 	+ "LEFT JOIN FETCH UserBadge ub "
	// 	+ "ON b.badgeId = ub.badgeId "
	// 	+ "WHERE ub.userId IS NULL "
	// 	+ "OR ub.userId = :userId")
	// List<Object[]> findWithUser(@Param("userId") Long userId);

}
