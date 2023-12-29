package com.wedding.planning.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import java.util.List;

import com.wedding.planning.system.dao.ServiceCategoriesDao;
import com.wedding.planning.system.model.ServiceCategories;

@Service
public class ServicecategoryService {
    @Autowired
    private ServiceCategoriesDao dao;

    public ResponseEntity<List<ServiceCategories>> getAllServiceCategories() {
        return ResponseEntity.ok().body(dao.findAll());
    }
}
