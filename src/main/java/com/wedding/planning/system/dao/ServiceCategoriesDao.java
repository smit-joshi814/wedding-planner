package com.wedding.planning.system.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planning.system.model.ServiceCategories;

public interface ServiceCategoriesDao extends JpaRepository<ServiceCategories, Integer> {

}
