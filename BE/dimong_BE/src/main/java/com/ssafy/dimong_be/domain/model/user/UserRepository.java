package com.ssafy.dimong_be.domain.model.user;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	boolean existsByProviderTypeAndProviderId(ProviderType providerType, String providerId);

	Optional<User> findByProviderId(String providerId);

}
