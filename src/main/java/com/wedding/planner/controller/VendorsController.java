package com.wedding.planner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.planner.entity.Vendor;
import com.wedding.planner.service.StatesService;
import com.wedding.planner.service.VendorService;

@Controller
public class VendorsController {

	@Autowired
	private StatesService statesService;

	@Autowired
	private VendorService vendorService;

	@RequestMapping("/vendors")
	public ModelAndView vendors(ModelAndView mv) {
		mv.setViewName("vendors");
		mv.addObject("vendorList", vendorService.getVendors().getBody());
		return mv;
	}

	@GetMapping("/vendor")
	public ModelAndView vendors(ModelAndView mv, @RequestParam("vendor") Vendor vendor) {
		mv.setViewName("vendor-view");
		mv.addObject("vendor", vendor);
		mv.addObject("states", statesService.getStates().getBody());

		return mv;
	}
}