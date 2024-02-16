package com.wedding.planner.service;

import org.springframework.http.ResponseEntity;

import com.wedding.planner.entity.Images;

public interface ImageService {

	/**
	 * add Images to the database
	 * 
	 * @param image
	 * @return {@link ResponseEntity<Images>} added {@link Images}
	 */
	ResponseEntity<Images> addImage(Images image);

	/**
	 * updates existing Images to provided @param image
	 * 
	 * @param image
	 * @return {@link ResponseEntity<Images>} updated {@link Images}
	 */
	ResponseEntity<Images> update(Images image);

	/**
	 * deletes if the @param image exists in the database
	 * 
	 * @param image
	 * @return {@link ResponseEntity<Boolean>} whether the image entity is deleted
	 */
	ResponseEntity<Boolean> delete(Images image);

}
