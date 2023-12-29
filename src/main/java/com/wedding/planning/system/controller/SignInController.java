package com.wedding.planning.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class SignInController {

    @RequestMapping("sign-in")
    public ModelAndView signIn() {
        return new ModelAndView("sign-in");
    }
    
}
