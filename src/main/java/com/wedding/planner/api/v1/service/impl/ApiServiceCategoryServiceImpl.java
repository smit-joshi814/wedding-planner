package com.wedding.planner.api.v1.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.api.v1.dto.ResponseDTO;
import com.wedding.planner.api.v1.dto.ServiceCategoryDTO;
import com.wedding.planner.api.v1.service.ApiServiceCategoryService;
import com.wedding.planner.entity.ServiceCategories;
import com.wedding.planner.repository.ServiceCategoriesRepository;

@Service
public class ApiServiceCategoryServiceImpl implements ApiServiceCategoryService {

	@Autowired
	private ServiceCategoriesRepository categoryRepo;

	@Override
	public ServiceCategoryDTO convertToDTO(ServiceCategories category) {
		return new ServiceCategoryDTO(category.getServiceCategoryId(), category.getServiceCategoryName(),
				category.getCategoryIcon(), category.isActive());
	}

	@Override
	public List<ServiceCategoryDTO> convertToDTO(List<ServiceCategories> category) {
		return category.stream().map(this::convertToDTO).collect(Collectors.toList());
	}

	@Override
	public ResponseEntity<ResponseDTO<List<ServiceCategoryDTO>>> serviceCategories() {
		long totalRecords = categoryRepo.count();
		Integer page=0;
		Integer perPage=10;
		Integer totalPages= (int) Math.ceil((double) totalRecords / perPage);
		return ResponseEntity.ok(new ResponseDTO<List<ServiceCategoryDTO>>(convertToDTO(categoryRepo.findAll()),
				totalRecords,page,perPage,totalPages));
	}

	@Override
	public ResponseEntity<ResponseDTO<List<ServiceCategoryDTO>>> serviceCategories(Pageable page) {
		long totalRecords = categoryRepo.count();
		Integer totalPages= (int) Math.ceil((double) totalRecords / page.getPageSize());
		return ResponseEntity.ok(new ResponseDTO<List<ServiceCategoryDTO>>(convertToDTO(categoryRepo.findAll(page).toList()),
				totalRecords,page.getPageNumber(),page.getPageSize(),totalPages));
	}

}
