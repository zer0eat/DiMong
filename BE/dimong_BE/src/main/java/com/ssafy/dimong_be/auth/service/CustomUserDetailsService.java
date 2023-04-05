package com.ssafy.dimong_be.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ssafy.dimong_be.auth.UserPrincipal;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.domain.model.user.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

	private final UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String providerId) throws UsernameNotFoundException {
		User user = userRepository.findByProviderId(providerId)
			.orElseThrow(() -> new UsernameNotFoundException("유저 정보 없음"));

		return UserPrincipal.create(user);
	}

}
