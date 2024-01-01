package com.wedding.planning.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.model.Variation;
import com.wedding.planning.system.model.VariationOption;
import com.wedding.planning.system.service.VariationOptionService;
import com.wedding.planning.system.service.VariationService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;

@Controller
@RequestMapping("/variations")
public class VariationController {

    @Autowired
    private VariationService service;

    @Autowired
    private VariationOptionService optionService;

    @RequestMapping
    public ModelAndView variations() {
        return new ModelAndView("variations").addObject("variationList", service.getVariations().getBody())
                .addObject("variationOptionList", optionService.getVariationOptions().getBody());
    }

    @PostMapping("/add-variations")
    public ResponseEntity<Variation> addVariation(@RequestParam("variation-name") String variationName,
            @RequestParam("service-category") ServiceCategories category) {
        return service.addVariation(variationName, category);
    }

    @GetMapping("/variations")
    public ResponseEntity<List<Variation>> getVariations() {
        return service.getVariations();
    }

    @PostMapping("/add-variation-options")
    public ResponseEntity<VariationOption> addVariationOption(@RequestParam("variations-select") Variation variation,
            @RequestParam("variation-option-name") String variationOption) {
        return optionService.addVariationOption(variation, variationOption);
    }

    @GetMapping("/variation-options")
    public ResponseEntity<List<VariationOption>> getVariationOptions() {
        return optionService.getVariationOptions();
    }

}
