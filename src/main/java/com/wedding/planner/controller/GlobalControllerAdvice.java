package com.wedding.planner.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.wedding.planner.entity.Users;
import com.wedding.planner.service.UserService;
import com.wedding.planner.utils.UtilityService;

@ControllerAdvice
public class GlobalControllerAdvice {
	
	@Autowired
	private UtilityService utility;

	@Autowired
	private UserService userService;

	
	@ModelAttribute("currentUser")
	public Users getUser() {
		return userService.getUser(utility.getCurrentUsername()).getBody();
	}
}