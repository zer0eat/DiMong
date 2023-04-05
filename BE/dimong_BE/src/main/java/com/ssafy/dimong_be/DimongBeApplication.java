package com.ssafy.dimong_be;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.reactive.function.client.WebClient;

import com.ssafy.dimong_be.auth.properties.AppProperties;
import com.ssafy.dimong_be.auth.properties.CorsProperties;

import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
@EnableJpaAuditing // JPA Auditing을 활성화
@EnableConfigurationProperties({
	AppProperties.class,
	CorsProperties.class
})
@Slf4j
public class DimongBeApplication {

	public static void main(String[] args) {
		SpringApplication.run(DimongBeApplication.class, args);
	}

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

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
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
