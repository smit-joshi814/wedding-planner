package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Couple;

public interface CoupleRepository extends JpaRepository<Couple, Long>{

}
