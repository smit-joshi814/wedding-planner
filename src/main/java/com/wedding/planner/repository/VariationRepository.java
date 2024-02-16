package com.wedding.planning.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.entity.Variation;

public interface VariationRepository extends JpaRepository<Variation,Integer>{
    
}
