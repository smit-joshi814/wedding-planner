package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class SignUpController {

    @RequestMapping("/sign-up")
    public ModelAndView signUp(){
        return new ModelAndView("sign-up");
    }
    
}
