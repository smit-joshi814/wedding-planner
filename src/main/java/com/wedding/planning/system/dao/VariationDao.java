package com.wedding.planning.system.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.model.Variation;

public interface VariationDao extends JpaRepository<Variation,Integer>{
    
}
