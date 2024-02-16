package com.wedding.planner.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.entity.Variation;
import com.wedding.planner.entity.VariationOption;
import com.wedding.planner.repository.VariationOptionRepository;
import com.wedding.planner.service.VariationOptionService;

@Service
public class VariationOptionServiceImpl implements VariationOptionService {

	@Autowired
	VariationOptionRepository dao;

	public ResponseEntity<List<VariationOption>> getVariationOptions() {
		return ResponseEntity.ok().body(dao.findAll());
	}

	public ResponseEntity<List<VariationOption>> getVariationOptions(Variation variationId) {
		return ResponseEntity.ok().body(dao.findByVariationId(variationId));
	}

	public ResponseEntity<VariationOption> getVariationOption(Integer optionId) {
		return ResponseEntity.ok().body(dao.findById(optionId).get());
	}

	public ResponseEntity<VariationOption> addVariationOption(Variation variation, String variationOption) {
		try {
			return ResponseEntity.ok().body(dao.save(
					VariationOption.builder().variationOptionName(variationOption).variationId(variation).build()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public ResponseEntity<String> deleteVariationOption(Integer optionId) {
		try {
			dao.deleteById(optionId);
			return ResponseEntity.ok().body("Variation Option Deleted");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Variation Option Not Found");
		}
	}

	public ResponseEntity<Boolean> deleteVariationOptionsBy(Variation variationId) {
		try {

			dao.deleteAll(dao.findByVariationId(variationId));
			return ResponseEntity.ok().body(true);
		} catch (Exception e) {
			return ResponseEntity.ok().body(false);
		}
	}

}
