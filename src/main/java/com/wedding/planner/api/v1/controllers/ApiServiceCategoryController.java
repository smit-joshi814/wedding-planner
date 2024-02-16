package com.wedding.planner.api.v1.controllers;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wedding.planner.api.v1.dto.ResponseDTO;
import com.wedding.planner.api.v1.dto.ServiceCategoryDTO;
import com.wedding.planner.api.v1.service.ApiServiceCategoryService;

@RestController
@RequestMapping("/api/v1/service-category")
public class ApiServiceCategoryController {

	@Autowired
	private ApiServiceCategoryService categoryService;

	@GetMapping("/all")
	public ResponseEntity<ResponseDTO<List<ServiceCategoryDTO>>> serviceCategories(@RequestParam("page") Integer page,@RequestParam("perPage") Integer perPage) {
		if (Objects.nonNull(page) && Objects.nonNull(perPage)) {
			return categoryService.serviceCategories(PageRequest.of(page, perPage));
		}
		return categoryService.serviceCategories();
	}
}
