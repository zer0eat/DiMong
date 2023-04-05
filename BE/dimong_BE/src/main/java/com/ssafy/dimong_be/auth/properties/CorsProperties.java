package com.ssafy.dimong_be.auth.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ConfigurationProperties(prefix = "cors")
public class CorsProperties {
	private String allowedOrigins;
	private String allowedMethods;
	private String allowedHeaders;
	private Long maxAge;
}
