package com.wedding.planner.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.ServiceItem;
import com.wedding.planner.entity.ServiceVariation;

public interface ServiceVariationRepository extends JpaRepository<ServiceVariation, Long> {

	List<ServiceVariation> findByItem(ServiceItem item);

	List<ServiceVariation> findByItemIsIn(List<ServiceItem> items);

}
