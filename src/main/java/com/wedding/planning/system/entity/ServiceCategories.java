package com.wedding.planning.system.model;

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
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer serviceCategoryId;
    private String serviceCategoryName;
    private String serviceCategoryIcon;
    private boolean isActive;
}