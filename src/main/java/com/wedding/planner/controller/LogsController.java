package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/logs")
public class LogsController {

    @RequestMapping
    public ModelAndView logs(){
        return new ModelAndView("logs");
    }
    
    
    
    
}
