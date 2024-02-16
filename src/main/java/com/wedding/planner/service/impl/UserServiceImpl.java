package com.wedding.planner.service.impl;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.entity.Users;
import com.wedding.planner.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Override
	public ResponseEntity<Users> getUser() {
		return null;
	}

}
