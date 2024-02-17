package com.wedding.planner.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.wedding.planner.entity.ServiceItem;
import com.wedding.planner.entity.ServiceVariation;
import com.wedding.planner.entity.Services;

public interface ServiceVariationService {

	/**
	 * Gets All the Service Variations from database
	 * 
	 * @return {@link ResponseEntity<List<ServiceVariation>>} list of
	 *         {@link ServiceVariation}
	 */
	ResponseEntity<List<ServiceVariation>> getAll();

	/**
	 * All the {@link ServiceVariation} list Based on the {@link ServiceItem}
	 * 
	 * @param item
	 * @return {@link ResponseEntity<List<ServiceVariation>>} list of
	 *         {@link ServiceVariation}
	 */
	ResponseEntity<List<ServiceVariation>> getAll(ServiceItem item);

	/**
	 * All the {@link ServiceVariation} list based on the Provided {@link Services}
	 * 
	 * @param service
	 * @return
	 */
	ResponseEntity<List<ServiceVariation>> getAll(Services service);

	/**
	 * Adds Provided {@link ServiceVariation} into database
	 * 
	 * @param variation
	 * @return {@link ResponseEntity<ServiceVariation>} added
	 *         {@link ServiceVariation} entity
	 */
	ResponseEntity<ServiceVariation> add(ServiceVariation variation);

	/**
	 * Deletes given {@link ServiceVariation}
	 * 
	 * @param variation
	 * @return {@link ResponseEntity<Sring>} Response string
	 */
	ResponseEntity<String> delete(ServiceVariation variation);

}
