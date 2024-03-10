package com.wedding.planner.service;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.wedding.planner.entity.Users;

public interface UserService {

	/**
	 * gets the User
	 * @return {@link ResponseEntity<User>} or {@link HttpStatus.NotFound}
	 */
	ResponseEntity<Users> getUser();
	
	/**
	 * updates the login status for user
	 * @param email
	 * @param status
	 * @return
	 */
	ResponseEntity<Boolean> updateLoginStatus(String email,Boolean status);
	
	/**
	 * Gets the user by email
	 * @param email
	 * @return
	 */
	ResponseEntity<Users> getUser(String email);
}
