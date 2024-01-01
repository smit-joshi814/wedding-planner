package com.wedding.planning.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

    public ResponseEntity<VariationOption> addVariationOption(Variation variation, String variationOption) {
        try {
            return ResponseEntity.ok().body(dao
                    .save(VariationOption.builder().variationOptionName(variationOption).variationId(variation)
                            .build()));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}