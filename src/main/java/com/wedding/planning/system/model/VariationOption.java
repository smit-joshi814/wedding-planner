package com.wedding.planning.system.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    Integer variationOptionId;
    String variationOptionName;
    @ManyToOne
    Variation variationId;
}