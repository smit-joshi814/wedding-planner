package com.wedding.planner.api.v1.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.api.v1.auth.SignUpRequest;
import com.wedding.planner.api.v1.dto.UserDTO;
import com.wedding.planner.api.v1.service.ApiUserService;
import com.wedding.planner.entity.Address;
import com.wedding.planner.entity.Cities;
import com.wedding.planner.entity.Users;
import com.wedding.planner.enums.UserRole;
import com.wedding.planner.service.CoupleService;
import com.wedding.planner.service.UserService;
import com.wedding.planner.utils.UtilityService;

@Service
public class ApiUserServiceImpl implements ApiUserService {

	@Autowired
	private UserService userService;

	@Autowired
	private CoupleService coupleService;

	@Autowired
	private UtilityService utility;

	@Override
	public ResponseEntity<Boolean> registerUser(SignUpRequest request) {
		try {
			Users user = Users.builder().firstName(request.firstName()).lastName(request.lastName())
					.email(request.email()).password(request.password()).role(UserRole.USER).build();

			user = userService.addUser(user).getBody();

			Boolean status = coupleService.addCouple(user, request.couple()).getStatusCode().equals(HttpStatus.OK);

			if (status) {
				return ResponseEntity.ok(true);
			} else {
				throw new RuntimeException("Internal Server error");
			}
		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<UserDTO> getUser() {
		return ResponseEntity.ok(convertToDTO(userService.getUser(utility.getCurrentUsername()).getBody()));
	}

	@Override
	public ResponseEntity<UserDTO> updateUser(UserDTO user) {
		Users changes = Users
				.builder().firstName(user.firstName()).lastName(user.lastName()).email(user.email()).phone(
						user.phone())
				.address(List.of(Address.builder().addressId(user.addressInfo().addressId())
						.addressLine1(user.addressInfo().addressLine1()).addressLine2(user.addressInfo().addressLine2())
						.city(Cities.builder().cityId(user.addressInfo().cityInfo().cityId())
								.cityName(user.addressInfo().cityInfo().cityName()).build())
						.build()))
				.build();
		return ResponseEntity.ok(convertToDTO(userService.updateUser(changes).getBody()));
	}

	@Override
	public ResponseEntity<Boolean> deleteUser() {
		Users user = userService.getUser(utility.getCurrentUsername()).getBody();
		return userService.deleteUser(user);
	}
}
