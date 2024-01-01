package com.wedding.planning.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planning.system.dao.VariationDao;
import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.model.Variation;

@Service
public class VariationService {

    @Autowired
    VariationDao dao;

    public ResponseEntity<List<Variation>> getVariations() {
        return ResponseEntity.ok().body(dao.findAll());
    }

    public ResponseEntity<Variation> addVariation(String variationName, ServiceCategories category) {
        try {
            return ResponseEntity.ok().body(
                    dao.save(Variation.builder().variationName(variationName).serviceCategoryId(category).build()));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
