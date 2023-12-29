package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class ForgetPasswordController {
    
    @RequestMapping("/forgetPassword")
    public ModelAndView forgetPassword() {
        return new ModelAndView("forgot-password");
    
    }
}
