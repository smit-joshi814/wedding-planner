package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Variation;

public interface VariationRepository extends JpaRepository<Variation,Integer>{
    
}
