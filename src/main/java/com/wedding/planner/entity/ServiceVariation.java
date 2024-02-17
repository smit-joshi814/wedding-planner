package com.wedding.planner.entity;

import jakarta.persistence.Entity;
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
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ServiceVariation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mapId;
	@ManyToOne
	@JoinColumn(name = "variation_option_id")
	private VariationOption option;
	@ManyToOne
	@JoinColumn(name = "service_item_id")
	private ServiceItem item;
}
