package com.wedding.planning.system.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planning.system.entity.ServiceCategories;
import com.wedding.planning.system.repository.ServiceCategoriesRepository;
import com.wedding.planning.system.service.ServicecategoryService;
import com.wedding.planning.system.service.StorageService;
import com.wedding.planning.system.storage.Storage;

@Service
public class ServicecategoryServiceImpl implements ServicecategoryService {

	@Autowired
	private ServiceCategoriesRepository dao;

	@Autowired
	private StorageService service;

	@Override
	public ResponseEntity<List<ServiceCategories>> getAllServiceCategories() {

		return ResponseEntity.ok().body(dao.findAll());
	}

	@Override
	public ResponseEntity<ServiceCategories> addServiceCategories(String serviceCategoryName, MultipartFile icon,
			boolean isActive) {
		String path = icon.getOriginalFilename();
		ServiceCategories category = ServiceCategories.builder().serviceCategoryName(serviceCategoryName)
				.isActive(isActive).build();
		try {
			path = service.upload(icon, path, Storage.STORAGE_CATEGORIES);
			String[] data = path.split(",");
			category.setServiceCategoryIcon(data[0]);
			category.setServiceCategoryIconPath(data[1]);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().body(null);
		}

		return ResponseEntity.ok().body(dao.save(category));
	}

	@Override
	public ResponseEntity<String> deleteServiceCategories(int serviceCategoryId) {
		try {
			service.delete(dao.findById(serviceCategoryId).get().getServiceCategoryIcon());
			dao.deleteById(serviceCategoryId);
			return ResponseEntity.ok().body("Category Deleted Successfully");
		} catch (Exception e) {
			if (e.getMessage().equals("403")) {
				return ResponseEntity.status(HttpStatus.FORBIDDEN)
						.body("Error deleting Category Image: Permission Denied");
			} else {
				dao.deleteById(serviceCategoryId);
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
			}
		}
	}

	@Override
	public ResponseEntity<ServiceCategories> editServiceCategories(Integer serviceCategoryId,
			String serviceCategoryName, MultipartFile serviceCategoryIcon, boolean isActive) {

		ServiceCategories dbCategory = dao.findById(serviceCategoryId).get();
		if (Objects.nonNull(isActive)) {
			dbCategory.setActive(isActive);
		}
		if (Objects.nonNull(serviceCategoryName) && !"".equalsIgnoreCase(serviceCategoryName)) {
			dbCategory.setServiceCategoryName(serviceCategoryName);
		}
		if (Objects.nonNull(serviceCategoryIcon) && !"".equalsIgnoreCase(serviceCategoryIcon.getOriginalFilename())) {
			try {
//				deleting old image
				service.delete(dbCategory.getServiceCategoryIcon());

				String[] data = service.upload(serviceCategoryIcon, serviceCategoryIcon.getOriginalFilename(),
						Storage.STORAGE_CATEGORIES).split(",");
				dbCategory.setServiceCategoryIcon(data[0]);
				dbCategory.setServiceCategoryIconPath(data[1]);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return ResponseEntity.ok().body(dao.save(dbCategory));
	}

}
