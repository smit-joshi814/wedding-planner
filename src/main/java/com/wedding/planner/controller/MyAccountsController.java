package com.wedding.planner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.planner.entity.Users;
import com.wedding.planner.entity.Vendor;
import com.wedding.planner.enums.UserRole;
import com.wedding.planner.service.UserService;
import com.wedding.planner.service.VendorService;
import com.wedding.planner.utils.UtilityService;

@Controller
@RequestMapping("/my-account")
public class MyAccountsController {

	@Autowired
	private UserService userService;

	@Autowired
	private VendorService vendorService;

	@Autowired
	private UtilityService utility;

	@RequestMapping
	public ModelAndView myAccount(ModelAndView mv) {
		Users user = userService.getUser(utility.getCurrentUsername()).getBody();

		if (user.getRole().equals(UserRole.VENDOR)) {
			Vendor vendor = vendorService.getvendor(user).getBody();
			mv.addObject("vendor", vendor);
		}

		mv.addObject("user", user);
		mv.setViewName("my-account");
		return mv;
	}

	@PostMapping("/user/avatar")
	public ResponseEntity<String> updateAvatar(@RequestParam("user-avatar") MultipartFile image) {
		return userService.updateAvatar(utility.getCurrentUsername(), image);
	}

}
