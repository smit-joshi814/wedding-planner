package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class ServiceVariationController {
    
    @RequestMapping("/service-variation")
    public ModelAndView serviceVariation() {
        return new ModelAndView("service-variations");
    } 
    

    
    
}
