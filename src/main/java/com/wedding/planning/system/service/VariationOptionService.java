package com.wedding.planning.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planning.system.dao.VariationOptionDao;
import com.wedding.planning.system.model.Variation;
import com.wedding.planning.system.model.VariationOption;

@Service
public class VariationOptionService {

    @Autowired
    VariationOptionDao dao;

    public ResponseEntity<List<VariationOption>> getVariationOptions() {
        return ResponseEntity.ok().body(dao.findAll());
    }

    public ResponseEntity<List<VariationOption>> getVariationOptions(Variation variationId) {
        return ResponseEntity.ok().body(dao.findByVariationId(variationId));
    }

    public ResponseEntity<VariationOption> getVariationOption(Integer optionId) {
        return ResponseEntity.ok().body(dao.findById(optionId).get());
    }

    public ResponseEntity<VariationOption> addVariationOption(Variation variation, String variationOption) {
        try {
            return ResponseEntity.ok().body(dao
                    .save(VariationOption.builder().variationOptionName(variationOption).variationId(variation)
                            .build()));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ResponseEntity<String> deleteVariationOption(Integer optionId) {
        try {
            dao.deleteById(optionId);
            return ResponseEntity.ok().body("Variation Option Deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Variation Option Not Found");
        }
    }

    public ResponseEntity<Boolean> deleteVariationOptionsBy(Variation variationId) {
        try {

            dao.deleteAll(dao.findByVariationId(variationId));
            return ResponseEntity.ok().body(true);
        } catch (Exception e) {
            return ResponseEntity.ok().body(false);
        }
    }
}