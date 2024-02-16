package com.wedding.planning.system.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.entity.Variation;
import com.wedding.planning.system.entity.VariationOption;

public interface VariationOptionRepository extends JpaRepository<VariationOption, Integer> {
    List<VariationOption> findByVariationId(Variation variationId);
}
