package com.wedding.planner.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.ServiceCategories;
import com.wedding.planner.entity.Variation;

public interface VariationRepository extends JpaRepository<Variation, Integer> {

	List<Variation> findByServiceCategory(ServiceCategories serviceCategory);

}
