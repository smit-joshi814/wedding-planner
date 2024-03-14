package com.wedding.planner.api.v1.service;

import org.springframework.http.ResponseEntity;

import com.wedding.planner.api.v1.auth.SignUpRequest;
import com.wedding.planner.entity.Users;

public interface ApiUserService {

	/**
	 * adds user
	 * 
	 * @param user
	 * @return
	 */
	ResponseEntity<Users> registerUser(SignUpRequest request);

	/**
	 * updates User
	 * 
	 * @param user
	 * @return
	 */
	ResponseEntity<Users> updateUser(Users user);

	/**
	 * delete User
	 * 
	 * @param user
	 * @return
	 */
	ResponseEntity<Boolean> deleteUser(Users user);

}
