package com.ssafy.dimong_be;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

// import com.ssafy.dimong_be.auth.config.properties.AppProperties;
// import com.ssafy.dimong_be.auth.config.properties.CorsProperties;
@SpringBootApplication
@EnableJpaAuditing // JPA Auditing을 활성화
@EnableConfigurationProperties({
	// AppProperties.class,
	// CorsProperties.class
})
public class DimongBeApplication {

	public static void main(String[] args) {
		SpringApplication.run(DimongBeApplication.class, args);
	}

	// @Bean
	// BCryptPasswordEncoder passwordEncoder() {
	// 	return new BCryptPasswordEncoder();
	// }

}
