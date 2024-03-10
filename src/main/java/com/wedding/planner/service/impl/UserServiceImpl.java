package com.wedding.planner.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.entity.Users;
import com.wedding.planner.repository.UsersRepository;
import com.wedding.planner.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UsersRepository usersRepo;

	@Override
	public ResponseEntity<Users> getUser() {
		return null;
	}

	@Override
	public ResponseEntity<Boolean> updateLoginStatus(String email, Boolean status) {
		try {
			Users dbUser = usersRepo.findByEmail(email);
			dbUser.setLoggedIn(status);
			usersRepo.save(dbUser);
			return ResponseEntity.ok(true);
		} catch (Exception e) {
			return ResponseEntity.ok(false);
		}

	}

	@Override
	public ResponseEntity<Users> getUser(String email) {
		try {
			Users user = usersRepo.findByEmail(email);
			return ResponseEntity.ok(user);
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

}
