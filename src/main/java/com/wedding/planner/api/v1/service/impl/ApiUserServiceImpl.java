package com.wedding.planner.api.v1.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planner.api.v1.auth.SignUpRequest;
import com.wedding.planner.api.v1.dto.CoupleDTO;
import com.wedding.planner.api.v1.dto.ImageDTO;
import com.wedding.planner.api.v1.dto.UserDTO;
import com.wedding.planner.api.v1.service.ApiUserService;
import com.wedding.planner.entity.Couple;
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
			Boolean status = false;
			Users user = Users.builder().firstName(request.firstName()).lastName(request.lastName())
					.email(request.email()).password(request.password()).role(UserRole.USER).build();

			user = userService.addUser(user).getBody();

			if (Objects.nonNull(request.user()) && !"".equals(request.user())) {
				Couple couple = coupleService.getCouple(Users.builder().userId(Long.parseLong(request.user())).build())
						.getBody();
				if (Objects.isNull(couple.getBride())) {
					couple.setBride(user);
				}
				if (Objects.isNull(couple.getGroom())) {
					couple.setGroom(user);
				}
				status = coupleService.updateCouple(couple).getStatusCode().equals(HttpStatus.OK);
			} else {
				status = coupleService.addCouple(user, request.couple()).getStatusCode().equals(HttpStatus.OK);
			}
			return ResponseEntity.ok(status);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<UserDTO> getUser() {
		return ResponseEntity.ok(convertToDTO(userService.getUser(utility.getCurrentUsername()).getBody()));
	}

	@Override
	public ResponseEntity<UserDTO> getUser(Long userId) {
		return ResponseEntity.ok(convertToDTO(userService.getUser(userId).getBody()));
	}

	@Override
	public ResponseEntity<UserDTO> updateUser(UserDTO user) {
		Users changes = Users.builder().userId(user.userId()).firstName(user.firstName()).lastName(user.lastName())
				.email(user.email()).phone(
						user.phone()).build();
		return ResponseEntity.ok(convertToDTO(userService.updateUser(changes).getBody()));
	}

	@Override
	public ResponseEntity<Boolean> deleteUser() {
		Users user = userService.getUser(utility.getCurrentUsername()).getBody();
		return userService.deleteUser(user);
	}

	@Override
	public ResponseEntity<ImageDTO> updateAvatar(MultipartFile file) {
		return ResponseEntity
				.ok(convertToDTO(userService.updateAvatarImage(utility.getCurrentUsername(), file).getBody()));

	}

	@Override
	public ResponseEntity<CoupleDTO> getCouple() {
		return ResponseEntity.ok(convertToDTO(
				coupleService.getCouple(userService.getUser(utility.getCurrentUsername()).getBody()).getBody()));
	}
}
