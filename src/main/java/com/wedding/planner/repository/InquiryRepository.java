package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Inquiry;
import com.wedding.planner.entity.Users;

import java.util.List;


public interface InquiryRepository extends JpaRepository<Inquiry, Long>{

	List<Inquiry> findByUser(Users user);
	
}
