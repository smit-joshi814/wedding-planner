package com.wedding.planner.api.v1.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

import com.wedding.planner.api.v1.dto.ResponseDTO;
import com.wedding.planner.api.v1.dto.ServiceCategoryDTO;
import com.wedding.planner.entity.ServiceCategories;

public interface ApiServiceCategoryService {
	
	ServiceCategoryDTO convertToDTO(ServiceCategories category);
	
	List<ServiceCategoryDTO> convertToDTO(List<ServiceCategories> category);

	ResponseEntity<ResponseDTO<List<ServiceCategoryDTO>>> serviceCategories();
	
	ResponseEntity<ResponseDTO<List<ServiceCategoryDTO>>> serviceCategories(Pageable page);
}
