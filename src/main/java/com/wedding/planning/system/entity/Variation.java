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
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Variation {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer variationId;
    private String variationName;
    @ManyToOne
    private ServiceCategories serviceCategoryId;
}
