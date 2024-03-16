package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Users;


public interface UsersRepository extends JpaRepository<Users, Long>{

	Users findByEmail(String email);

}
