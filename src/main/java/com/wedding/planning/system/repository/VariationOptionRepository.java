package com.wedding.planning.system.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.model.Variation;
import com.wedding.planning.system.model.VariationOption;

public interface VariationOptionDao extends JpaRepository<VariationOption, Integer> {
    List<VariationOption> findByVariationId(Variation variationId);
}
