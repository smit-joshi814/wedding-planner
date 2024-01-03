package com.wedding.planning.system.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planning.system.dao.VariationDao;
import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.model.Variation;
import org.springframework.http.HttpStatus;

@Service
public class VariationService {

    @Autowired
    VariationDao dao;

    @Autowired
    VariationOptionService optionService;

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

    public ResponseEntity<Variation> editVariation(Integer variationId, String variationName) {
        Variation dbVariation = dao.findById(variationId).get();
        if (Objects.nonNull(variationName) && !"".equals(variationName)) {
            dbVariation.setVariationName(variationName);
        }
        return ResponseEntity.ok().body(dao.save(dbVariation));
    }

    public ResponseEntity<String> deleteVariation(Variation variation) {
        try {
            optionService.deleteVariationOptionsBy(variation);
            dao.delete(variation);
            return ResponseEntity.ok().body("Variation Deleted Successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Variation Not Found");
        }
    }

}
