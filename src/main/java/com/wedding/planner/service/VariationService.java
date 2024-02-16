package com.wedding.planner.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.wedding.planner.entity.ServiceCategories;
import com.wedding.planner.entity.Variation;

public interface VariationService {

	/**
	 * gets All the Variations from database
	 * 
	 * @return {@link ResponseEntity<List<Variation>>}
	 */
	ResponseEntity<List<Variation>> getVariations();

	/**
	 * adds {@link Variation} to the database
	 * 
	 * @param variationName
	 * @param category
	 * @return {@link ResponseEntity<Variation>} added {@link Variation}
	 */
	ResponseEntity<Variation> addVariation(String variationName, ServiceCategories category);

	/**
	 * updates the existing variation
	 * 
	 * @param variationId
	 * @param variationName
	 * @return {@link ResponseEntity<Variation>} updated {@link Variation}
	 */
	ResponseEntity<Variation> editVariation(Integer variationId, String variationName);

	/**
	 * Deletes the provided {@link Variation} from the database
	 * 
	 * @param variation
	 * @return {@link ResponseEntity<String>}
	 */
	ResponseEntity<String> deleteVariation(Variation variation);

}
