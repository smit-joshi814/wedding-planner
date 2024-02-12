package com.wedding.planning.system.service.impl;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planning.system.entity.ServiceCategories;
import com.wedding.planning.system.entity.Variation;
import com.wedding.planning.system.repository.VariationRepository;
import com.wedding.planning.system.service.VariationOptionService;
import com.wedding.planning.system.service.VariationService;

@Service
public class VariationServiceImpl implements VariationService {

	@Autowired
	VariationRepository dao;

	@Autowired
	VariationOptionService optionService;

	public ResponseEntity<List<Variation>> getVariations() {
		return ResponseEntity.ok().body(dao.findAll());
	}

	public ResponseEntity<Variation> addVariation(String variationName, ServiceCategories category) {
		try {
			return ResponseEntity.ok().body(
					dao.save(Variation.builder().variationName(variationName).serviceCategoryId(category).build()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public ResponseEntity<Variation> editVariation(Integer variationId, String variationName) {
		Variation dbVariation = dao.findById(variationId).get();
		if (Objects.nonNull(variationName) && !"".equals(variationName)) {
			dbVariation.setVariationName(variationName);
		}
		return ResponseEntity.ok().body(dao.save(dbVariation));
	}

	public ResponseEntity<String> deleteVariation(Variation variation) {
		try {
			optionService.deleteVariationOptionsBy(variation);
			dao.delete(variation);
			return ResponseEntity.ok().body("Variation Deleted Successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Variation Not Found");
		}
	}

}
