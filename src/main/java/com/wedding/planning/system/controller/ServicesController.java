package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/services")
public class ServicesController {

    @RequestMapping
    public ModelAndView services() {
        return new ModelAndView("services");
    }
    
    
}
