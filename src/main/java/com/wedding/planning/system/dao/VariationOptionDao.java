package com.wedding.planning.system.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.model.VariationOption;

public interface VariationOptionDao extends JpaRepository<VariationOption, Integer> {

}
