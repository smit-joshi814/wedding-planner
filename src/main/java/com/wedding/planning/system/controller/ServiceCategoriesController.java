package com.wedding.planning.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.service.ServicecategoryService;

import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
@RequestMapping("/service-categories")
public class ServiceCategoriesController {

	@Autowired
	private ServicecategoryService service;

	@RequestMapping
	public ModelAndView serviceCategories() {
		return new ModelAndView("service-categories");
	}

	@GetMapping("/categories")
	public ResponseEntity<List<ServiceCategories>> getAllServiceCategories() {
		return service.getAllServiceCategories();
	}

}
