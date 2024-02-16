package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Services;

public interface ServicesRepository extends JpaRepository<Services, Long>{
	
}
