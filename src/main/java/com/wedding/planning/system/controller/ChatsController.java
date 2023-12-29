package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chats")
public class ChatsController {

	@RequestMapping
	public ModelAndView chats() {
		return new ModelAndView("chats");
	}
	
}
