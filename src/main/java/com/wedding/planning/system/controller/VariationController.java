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

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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

    /* VARIATION APIs */

    // add variations
    @PostMapping("/add-variations")
    public ResponseEntity<Variation> addVariation(@RequestParam("variation-name") String variationName,
            @RequestParam("service-category") ServiceCategories category) {
        return service.addVariation(variationName, category);
    }

    // get all available variations
    @GetMapping("/variations")
    public ResponseEntity<List<Variation>> getVariations() {
        return service.getVariations();
    }

    // edit variation
    @PutMapping("edit-variations")
    public ResponseEntity<Variation> editVariation(@RequestParam("variationId") Integer variationId,
            @RequestParam("variationName") String variationName) {
        return service.editVariation(variationId, variationName);
    }


    @DeleteMapping("/delete-variations/{id}")
    public ResponseEntity<String> deleteVariation(@PathVariable("id") Variation variation) {
        return service.deleteVariation(variation);
    }

    /* VARIATION OPTION APIs */

    // add variation option
    @PostMapping("/add-variation-options")
    public ResponseEntity<VariationOption> addVariationOption(@RequestParam("variations-select") Variation variation,
            @RequestParam("variation-option-name") String variationOption) {
        return optionService.addVariationOption(variation, variationOption);
    }

    // get all available variation options
    @GetMapping("/variation-options")
    public ResponseEntity<List<VariationOption>> getVariationOptions() {
        return optionService.getVariationOptions();
    }

    // delete variation option
    @DeleteMapping("/delete-variation-option/{id}")
    public ResponseEntity<String> deleteVariationOption(@PathVariable("id") Integer optionId) {
        return optionService.deleteVariationOption(optionId);
    }

}
