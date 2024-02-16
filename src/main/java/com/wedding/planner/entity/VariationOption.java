package com.wedding.planner.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class VariationOption {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer variationOptionId;
	String variationOptionName;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "variation_id")
	Variation variationId;
}