package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class ServicesController {

    @RequestMapping("/services")
    public ModelAndView services() {
        return new ModelAndView("services");
    }
    
    
}
