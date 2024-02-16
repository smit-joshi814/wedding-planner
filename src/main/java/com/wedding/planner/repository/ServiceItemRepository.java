package com.wedding.planner.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.ServiceItem;
import com.wedding.planner.entity.Services;

public interface ServiceItemRepository extends JpaRepository<ServiceItem, Long> {

	List<ServiceItem> findByService(Services service);

}
