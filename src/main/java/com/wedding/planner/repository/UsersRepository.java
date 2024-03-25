package com.wedding.planner.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Users;
import com.wedding.planner.enums.UserRole;



public interface UsersRepository extends JpaRepository<Users, Long>{

	Users findByEmail(String email);
	
	List<Users> findByRole(UserRole role);
	
	List<Users> findByRoleAndFirstNameContainingIgnoreCase(UserRole role,String search);
	
	List<Users> findByRoleAndLastNameContainingIgnoreCase(UserRole role,String search);

}
