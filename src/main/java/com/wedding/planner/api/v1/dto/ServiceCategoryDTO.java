package com.wedding.planner.api.v1.dto;

import com.wedding.planner.entity.Images;

public record ServiceCategoryDTO(Integer serviceCategoryId, String serviceCategoryName,Images icon , boolean isActive) {
}