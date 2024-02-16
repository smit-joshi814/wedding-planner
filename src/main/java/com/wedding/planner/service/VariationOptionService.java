package com.wedding.planning.system.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.wedding.planning.system.entity.Variation;
import com.wedding.planning.system.entity.VariationOption;

public interface VariationOptionService {

	ResponseEntity<List<VariationOption>> getVariationOptions();

	ResponseEntity<List<VariationOption>> getVariationOptions(Variation variationId);

	ResponseEntity<VariationOption> getVariationOption(Integer optionId);

	ResponseEntity<VariationOption> addVariationOption(Variation variation, String variationOption);

	ResponseEntity<String> deleteVariationOption(Integer optionId);

	ResponseEntity<Boolean> deleteVariationOptionsBy(Variation variationId);
}