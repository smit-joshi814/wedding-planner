package com.wedding.planner.api.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.api.v1.auth.SignUpRequest;
import com.wedding.planner.api.v1.service.ApiUserService;
import com.wedding.planner.entity.Users;
import com.wedding.planner.enums.UserRole;
import com.wedding.planner.service.CoupleService;
import com.wedding.planner.service.UserService;

@Service
public class ApiUserServiceImpl implements ApiUserService {

	@Autowired
	private UserService userService;

	@Autowired
	private CoupleService coupleService;

	@Override
	public ResponseEntity<Users> registerUser(SignUpRequest request) {
		try {
			Users user = Users.builder().firstName(request.firstName()).lastName(request.lastName())
					.email(request.email()).password(request.password()).role(UserRole.USER).build();

			user = userService.addUser(user).getBody();

			Boolean status = coupleService.addCouple(user, request.couple()).getStatusCode().equals(HttpStatus.OK);

			if (status) {
				return ResponseEntity.ok(user);
			} else {
				throw new RuntimeException("Internal Server error");
			}
		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<Users> updateUser(Users user) {
		return userService.updateUser(user);
	}

	@Override
	public ResponseEntity<Boolean> deleteUser(Users user) {
		return userService.deleteUser(user);
	}

}
