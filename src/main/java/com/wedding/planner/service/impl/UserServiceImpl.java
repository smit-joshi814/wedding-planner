package com.wedding.planner.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planner.entity.Address;
import com.wedding.planner.entity.Images;
import com.wedding.planner.entity.Users;
import com.wedding.planner.repository.UsersRepository;
import com.wedding.planner.service.StorageService;
import com.wedding.planner.service.UserService;
import com.wedding.planner.utils.UtilityService;
import com.wedding.planner.utils.impl.Storage;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UsersRepository usersRepo;

	@Autowired
	private UtilityService utility;

	@Autowired
	private StorageService storage;

	@Override
	public ResponseEntity<List<Users>> getUsers() {
		return ResponseEntity.ok(usersRepo.findAll());
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
	
	@Override
	public ResponseEntity<Users> getUser(Long userId) {
		try {
			Users user = usersRepo.findById(userId).get();
			return ResponseEntity.ok(user);
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@Override
	public ResponseEntity<Users> addUser(Users user) {
		try {
			user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
			user.setLoggedIn(false);
			user.setStatus(true);
			user = usersRepo.save(user);
			return ResponseEntity.ok().body(user);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
	}

	@Override
	public ResponseEntity<Users> updateUser(Users user) {
		Optional<Users> dbUserOpt = usersRepo.findById(user.getUserId());

		if (dbUserOpt.isPresent()) {
//		first NAME
			if (Objects.nonNull(user.getFirstName()) && !"".equalsIgnoreCase(user.getFirstName())) {
				dbUserOpt.ifPresent(data -> data.setFirstName(user.getFirstName()));
			}

//		last NAME
			if (Objects.nonNull(user.getLastName()) && !"".equalsIgnoreCase(user.getLastName())) {
				dbUserOpt.ifPresent(data -> data.setLastName(user.getLastName()));
			}

//		email
			if (Objects.nonNull(user.getEmail()) && !"".equalsIgnoreCase(user.getEmail())) {
				dbUserOpt.ifPresent(data -> data.setEmail(user.getEmail()));
			}

//		phone
			if (Objects.nonNull(user.getPhone()) && !"".equalsIgnoreCase(user.getPhone())) {
				dbUserOpt.ifPresent(data -> data.setPhone(user.getPhone()));
			}

//		address
			if (Objects.nonNull(user.getAddress())) {
				dbUserOpt.ifPresent(data -> {
					Address address = user.getAddress().get(0);
					address.setAddressId(data.getAddress().get(0).getAddressId());
					if (address.getCity() == null) {
						address.setCity(data.getAddress().get(0).getCity());
					}
					data.setAddress(user.getAddress());
				});
			}

//		password
			if (Objects.nonNull(user.getPassword()) && !"".equalsIgnoreCase(user.getPassword())) {
				utility.invalidateUserSession(user.getEmail());
				dbUserOpt.ifPresent(data -> data.setPassword(new BCryptPasswordEncoder().encode(user.getPassword())));
			}

//		status
			if (Objects.nonNull(user.getStatus())) {
				if (!user.getStatus()) {
					utility.invalidateUserSession(user.getEmail());
				}
				dbUserOpt.ifPresent(data -> data.setStatus(user.getStatus()));
			}

//		login
			if (Objects.nonNull(user.getLoggedIn())) {
				utility.invalidateUserSession(user.getEmail());
				dbUserOpt.ifPresent(data -> data.setLoggedIn(user.getLoggedIn()));
			}

//		Saving New Updated User
			return ResponseEntity.ok().body(usersRepo.save(dbUserOpt.get()));

		}
		return ResponseEntity.notFound().build();
	}

	@Override
	public ResponseEntity<Boolean> deleteUser(Users user) {
		Optional<Users> dbuser = usersRepo.findById(user.getUserId());
		if (dbuser.isPresent()) {
			usersRepo.delete(dbuser.get());
			return ResponseEntity.ok(true);
		}
		return ResponseEntity.notFound().build();
	}

	@Override
	public ResponseEntity<String> updateAvatar(String email, MultipartFile file) {
		try {
			Users dbUser = usersRepo.findByEmail(email);
			if (dbUser.getAvatar() != null) {
				storage.delete(dbUser.getAvatar());
			}
			Images image = storage.upload(file, dbUser.getFirstName(), Storage.STORAGE_AVATAR);
			dbUser.setAvatar(image);
			usersRepo.save(dbUser);
			return ResponseEntity.ok(image.getUrl());
		} catch (IOException e) {
			return ResponseEntity.internalServerError().body(e.getMessage());
		}
	}
	
	@Override
	public ResponseEntity<Images> updateAvatarImage(String email, MultipartFile file) {
		try {
			Users dbUser = usersRepo.findByEmail(email);
			if (dbUser.getAvatar() != null) {
				storage.delete(dbUser.getAvatar());
			}
			Images image = storage.upload(file, dbUser.getFirstName(), Storage.STORAGE_AVATAR);
			dbUser.setAvatar(image);
			usersRepo.save(dbUser);
			return ResponseEntity.ok(image);
		} catch (IOException e) {
			return ResponseEntity.internalServerError().build();
		}
	}
}