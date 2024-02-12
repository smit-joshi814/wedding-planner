package com.wedding.planning.system.service;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planning.system.entity.ServiceCategories;

public interface ServicecategoryService {

	ResponseEntity<List<ServiceCategories>> getAllServiceCategories();

	ResponseEntity<ServiceCategories> addServiceCategories(String serviceCategoryName, MultipartFile icon,
			boolean isActive);

	ResponseEntity<String> deleteServiceCategories(int serviceCategoryId);

	ResponseEntity<ServiceCategories> editServiceCategories(Integer serviceCategoryId, String serviceCategoryName,
			MultipartFile serviceCategoryIcon, boolean isActive);

}
