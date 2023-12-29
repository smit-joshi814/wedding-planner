package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/variations")
public class VariationController {

    @RequestMapping  
	public ModelAndView variations(){
        return new ModelAndView("variations");
    }
}
