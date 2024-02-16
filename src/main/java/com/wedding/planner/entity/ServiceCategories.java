package com.wedding.planning.system.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ServiceCategories {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer serviceCategoryId;
	private String serviceCategoryName;
	private String serviceCategoryIcon;
	private String serviceCategoryIconPath;
	private boolean isActive;

	@CreationTimestamp
	private LocalDateTime createdAt;

	@UpdateTimestamp
	private LocalDateTime updatedAt;
}