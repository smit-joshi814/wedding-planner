package com.wedding.planning.system.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.wedding.planning.system.entity.ServiceCategories;
import com.wedding.planning.system.entity.Variation;

public interface VariationService {

	ResponseEntity<List<Variation>> getVariations();

	ResponseEntity<Variation> addVariation(String variationName, ServiceCategories category);

	ResponseEntity<Variation> editVariation(Integer variationId, String variationName);

	ResponseEntity<String> deleteVariation(Variation variation);

}
