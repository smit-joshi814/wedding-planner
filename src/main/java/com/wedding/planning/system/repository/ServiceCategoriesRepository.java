package com.wedding.planning.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.entity.ServiceCategories;

public interface ServiceCategoriesRepository extends JpaRepository<ServiceCategories, Integer> {

}
