package com.wedding.planner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/forgetPassword")
public class ForgetPasswordController {

    @RequestMapping
    public ModelAndView forgetPassword() {
        return new ModelAndView("forgot-password");

    }
}
