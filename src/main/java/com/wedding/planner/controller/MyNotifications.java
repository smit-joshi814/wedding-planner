package com.wedding.planner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/my-notifications")
public class MyNotifications {

	@RequestMapping
	public ModelAndView myNotifications() {
		return new ModelAndView("my-notifications");
	}
}
