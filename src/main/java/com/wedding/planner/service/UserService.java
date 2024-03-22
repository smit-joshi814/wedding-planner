package com.wedding.planner.service;


import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planner.entity.Images;
import com.wedding.planner.entity.Users;

public interface UserService {

	/**
	 * Adds user into database
	 *
	 * @param user
	 * @return
	 */
	ResponseEntity<Users> addUser(Users user);

	/**
	 * updates old user to provided user
	 *
	 * @param user
	 * @return
	 */
	ResponseEntity<Users> updateUser(Users user);

	/**
	 * gets the Users list
	 *
	 * @return
	 */
	ResponseEntity<List<Users>> getUsers();

	/**
	 * updates the login status for user
	 *
	 * @param email
	 * @param status
	 * @return
	 */
	ResponseEntity<Boolean> updateLoginStatus(String email, Boolean status);

	/**
	 * Gets the user by email
	 *
	 * @param email
	 * @return
	 */
	ResponseEntity<Users> getUser(String email);
	
	/**
	 * Gets User By UserId
	 * @param userId
	 * @return
	 */
	ResponseEntity<Users> getUser(Long userId);

	/**
	 * Deletes given User
	 *
	 * @param user
	 * @return
	 */
	ResponseEntity<Boolean> deleteUser(Users user);
	
	/**
	 * updates user's avatar
	 * @param email
	 * @param file
	 * @return
	 */
	ResponseEntity<String> updateAvatar(String email,MultipartFile file);
	
	/**
	 * updates user's avatar
	 * @param email
	 * @param file
	 * @return
	 */
	ResponseEntity<Images> updateAvatarImage(String email,MultipartFile file);
}
