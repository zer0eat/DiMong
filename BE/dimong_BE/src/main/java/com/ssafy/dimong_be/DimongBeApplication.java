package com.ssafy.dimong_be;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.beans.factory.annotation.Value;
import jakarta.annotation.PostConstruct;

import lombok.extern.slf4j.Slf4j;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

// import com.ssafy.dimong_be.auth.config.properties.AppProperties;
// import com.ssafy.dimong_be.auth.config.properties.CorsProperties;
@SpringBootApplication
@EnableJpaAuditing // JPA Auditing을 활성화
@EnableConfigurationProperties({
	// AppProperties.class,
	// CorsProperties.class
})
@Slf4j
public class DimongBeApplication {

	public static void main(String[] args) {
		SpringApplication.run(DimongBeApplication.class, args);
	}

	// @Bean
	// BCryptPasswordEncoder passwordEncoder() {
	// 	return new BCryptPasswordEncoder();
	// }

	@Bean
	public ThreadPoolTaskExecutor taskExecutor() {
		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
		executor.setCorePoolSize(5);
		executor.setMaxPoolSize(10);
		executor.setQueueCapacity(100);
		executor.setThreadNamePrefix("slow-");
		executor.initialize();
		return executor;
	}

	@Value("${app.target.uri}")
	private String targetUri;

	@Bean
	public WebClient webClient() {
		return WebClient.builder().baseUrl(targetUri).build();
	}

	@PostConstruct
	public void init() {
		log.info("CPU: {}", Runtime.getRuntime().availableProcessors());
	}

}
