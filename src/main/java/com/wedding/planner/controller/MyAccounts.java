package com.wedding.planner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/my-account")
public class MyAccounts {
    
    @RequestMapping
    public ModelAndView myAccount() {
        return new ModelAndView("my-account");
    }    
    
    
}
