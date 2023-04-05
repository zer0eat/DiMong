// package com.ssafy.dimong_be.auth.repository;
//
// import java.util.Optional;
//
// import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.stereotype.Repository;
//
// import com.ssafy.dimong_be.domain.model.user.ProviderType;
// import com.ssafy.dimong_be.domain.model.user.UserRefreshToken;
//
// @Repository
// public interface UserRefreshTokenRepository extends JpaRepository<UserRefreshToken, Long> {
//
// 	Optional<UserRefreshToken> findByUser_UserEmail(String userEmail);
//
// 	Optional<UserRefreshToken> findOneByUserId(Long userId);
//
// 	UserRefreshToken findByUserIdAndRefreshToken(Long userId, String refreshToken);
//
// 	Optional<UserRefreshToken> findByUser_ProviderTypeAndUser_ProviderId(ProviderType providerType, String providerId);
//
// 	long deleteByUserId(Long userId);
//
// 	UserRefreshToken findByRefreshToken(String refreshToken);
//
// }
