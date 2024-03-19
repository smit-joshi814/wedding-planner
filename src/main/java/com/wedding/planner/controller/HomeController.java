package com.wedding.planner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public ModelAndView home() {
		return new ModelAndView("index");
	}
	
	@RequestMapping
	public ModelAndView redirectToHome() {
		return new ModelAndView("redirect:/home");
	}
}
