package com.ssafy.dimong_be.domain.model.common;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

// @EqualsAndHashCode
@MappedSuperclass //JPA Entity 클래스들이 해당 추상 클래스를 상속할 경우 createDate, modifiedDate를 컬럼으로 인식
@Getter
@EntityListeners(AuditingEntityListener.class)
//해당 클래스에 Auditing 기능을 포함 (Audit은 감시하다, 감사하다라는 뜻으로 Spring Data JPA에서 시간에 대해서 자동으로 값을 넣어주는 기능)
// @JsonIgnoreProperties(
// 	value = {"createdAt", "updatedAt"},
// 	allowGetters = true
// )
@SuperBuilder(toBuilder = true)
@NoArgsConstructor
public abstract class BaseEntity implements Serializable {

	@CreatedDate
	@Column(name = "created_at")
	// @Temporal(TemporalType.TIMESTAMP)
	private LocalDateTime createdAt;

	@LastModifiedDate
	@Column(name = "updated_at")
	// @Temporal(TemporalType.TIMESTAMP)
	private LocalDateTime updatedAt;

}
