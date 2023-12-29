package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/service-variation")
public class ServiceVariationController {
    
    @RequestMapping
    public ModelAndView serviceVariation() {
        return new ModelAndView("service-variations");
    } 
    

    
    
}
