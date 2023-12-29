package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sign-up")
public class SignUpController {

    @RequestMapping
    public ModelAndView signUp(){
        return new ModelAndView("sign-up");
    }
    
}
