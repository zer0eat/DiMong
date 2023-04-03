package com.ssafy.dimong_be.domain.model.badge;

import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BadgeQueryRepository {

	private final EntityManager em;

	public List<Object[]> findWithUser(@Param("userId") Long userId) {
		return em.createNativeQuery(
				new StringBuilder()
					.append("SELECT b.badge_id, b.badge_image_url, b.badge_name, b.dinosaur_id, IF(ub2.user_id IS NULL, null, 1) AS is_collected, ub2.created_at ")
					.append("FROM BADGES b ")
					.append("LEFT JOIN (")
					.append("SELECT ub1.user_id, ub1.badge_id, ub1.created_at ")
					.append("FROM USER_BADGES ub1 ")
					.append("WHERE ub1.user_id = ?) ub2 ")
					.append("ON b.badge_id = ub2.badge_id")
					.toString()
				, Object.class)
			.setParameter(1, userId)
			.getResultList();
	}

}
