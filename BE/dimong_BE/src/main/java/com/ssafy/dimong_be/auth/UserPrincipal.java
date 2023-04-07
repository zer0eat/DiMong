package com.ssafy.dimong_be.auth;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.OidcUserInfo;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.ssafy.dimong_be.domain.model.user.ProviderType;
import com.ssafy.dimong_be.domain.model.user.User;
import com.ssafy.dimong_be.domain.model.user.UserRole;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder(toBuilder = true)
public class UserPrincipal implements OAuth2User, UserDetails, OidcUser {
	private final Long userId;
	// private final String username;
	private final String password;
	private final ProviderType providerType;
	private final UserRole userRole;
	private final Collection<GrantedAuthority> authorities;
	private Map<String, Object> attributes;

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getName() {
		return String.valueOf(this.userId);
	}

	@Override
	public String getUsername() {
		return String.valueOf(this.userId);
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Map<String, Object> getClaims() {
		return null;
	}

	@Override
	public OidcUserInfo getUserInfo() {
		return null;
	}

	@Override
	public OidcIdToken getIdToken() {
		return null;
	}

	public static UserPrincipal create(User user) {
		// return new UserPrincipal(
		// 	user.getUserId(),
		// 	user.getUserNickname(),
		// 	user.getUserPassword(),
		// 	user.getProviderType(),
		// 	RoleType.USER,
		// 	Collections.singletonList(new SimpleGrantedAuthority(RoleType.USER.getCode()))
		// );

		UserPrincipal userPrincipal = UserPrincipal.builder()
			.userId(user.getUserId())
			// .username(user.getUserNickname())
			.password(null)
			.userRole(UserRole.USER)
			.authorities(Collections.singletonList(new SimpleGrantedAuthority(UserRole.USER.getCode())))
			.build();

		if (user.getProviderType() != null) {
			userPrincipal = userPrincipal.toBuilder()
				.providerType(user.getProviderType())
				.build();
		}

		return userPrincipal;
	}

	public static UserPrincipal create(User user, Map<String, Object> attributes) {
		UserPrincipal userPrincipal = create(user);
		userPrincipal.setAttributes(attributes);

		return userPrincipal;
	}
}
