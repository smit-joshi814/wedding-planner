package com.wedding.planner.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.entity.ServiceItem;
import com.wedding.planner.entity.ServiceVariation;
import com.wedding.planner.entity.Services;
import com.wedding.planner.repository.ServiceVariationRepository;
import com.wedding.planner.service.ServiceItemService;
import com.wedding.planner.service.ServiceVariationService;

@Service
public class ServiceVariationServiceImpl implements ServiceVariationService {

	@Autowired
	private ServiceVariationRepository serviceVariationRepo;

	@Autowired
	private ServiceItemService itemService;

	@Override
	public ResponseEntity<List<ServiceVariation>> getAll() {
		return ResponseEntity.ok(serviceVariationRepo.findAll());
	}

	@Override
	public ResponseEntity<List<ServiceVariation>> getAll(ServiceItem item) {
		try {
			List<ServiceVariation> serviceVariations = serviceVariationRepo.findByItem(item);
			if (serviceVariations.size() == 0) {
				throw new Exception("No Service Variation For this Item Exist");
			}
			return ResponseEntity.ok(serviceVariations);
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@Override
	public ResponseEntity<List<ServiceVariation>> getAll(Services service) {
		try {
			List<ServiceItem> serviceItems = itemService.getAll(service).getBody();
			List<ServiceVariation> serviceVariations = serviceVariationRepo.findByItemIsIn(serviceItems);
			if (serviceVariations.size() == 0) {
				throw new Exception("No Service Variations Found");
			}
			return ResponseEntity.ok(serviceVariations);
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@Override
	public ResponseEntity<ServiceVariation> add(ServiceVariation variation) {
		try {
			return ResponseEntity.ok(serviceVariationRepo.save(variation));
		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<String> delete(ServiceVariation variation) {
		try {
			serviceVariationRepo.delete(variation);
			return ResponseEntity.ok("Service Vaiation Deleted SuccessFully");
		} catch (Exception e) {
			return ResponseEntity.ok("No Service Variation Found");
		}
	}

}
