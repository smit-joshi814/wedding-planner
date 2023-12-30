package com.wedding.planning.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.service.ServicecategoryService;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/service-categories")
public class ServiceCategoriesController {

	@Autowired
	private ServicecategoryService service;

	@RequestMapping
	public ModelAndView serviceCategories() {
		return new ModelAndView("service-categories").addObject("serviceCategories",
				getAllServiceCategories().getBody());
	}

	@GetMapping("/categories")
	public ResponseEntity<List<ServiceCategories>> getAllServiceCategories() {
		return service.getAllServiceCategories();
	}

	@PostMapping("/add-service-categories")
	public ResponseEntity<ServiceCategories> addServiceCategories(
			@RequestParam("serviceCategoryName") String serviceCategoryName,
			@RequestParam("serviceCategoryIcon") MultipartFile serviceCategoryIcon,
			@RequestParam("isActive") boolean isActive) {
		return service.addServiceCategories(serviceCategoryName, serviceCategoryIcon, isActive);
	}

	@DeleteMapping("/delete-service-categories/{id}")
	public ResponseEntity<String> deleteServiceCategories(@PathVariable("id") int serviceCategoryId) {
		return service.deleteServiceCategories(serviceCategoryId);
	}

}
