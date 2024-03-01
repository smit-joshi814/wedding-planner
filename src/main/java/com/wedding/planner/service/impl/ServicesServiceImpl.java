package com.wedding.planner.service.impl;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.entity.Services;
import com.wedding.planner.repository.ServicesRepository;
import com.wedding.planner.service.ServicesService;

@Service
public class ServicesServiceImpl implements ServicesService {

	@Autowired
	private ServicesRepository servicesRepo;

	@Override
	public ResponseEntity<List<Services>> getAll() {
		return ResponseEntity.ok(servicesRepo.findAll());
	}

	@Override
	public ResponseEntity<Services> add(Services service) {
		try {
			return ResponseEntity.ok(servicesRepo.save(service));
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<Services> update(Services service) {
		Services dbService = servicesRepo.findById(service.getServiceId()).get();
		if (Objects.nonNull(service.getServiceName()) && !"".equalsIgnoreCase(service.getServiceName())) {
			dbService.setServiceName(service.getServiceName());
		}

		if (Objects.nonNull(service.getServiceDescription()) && !"".equalsIgnoreCase(service.getServiceDescription())) {
			dbService.setServiceDescription(service.getServiceDescription());
		}

		if (Objects.nonNull(service.getStatus())) {
			dbService.setStatus(service.getStatus());
		}

		if (Objects.nonNull(service.getServicecategory())
				&& !dbService.getServicecategory().equals(service.getServicecategory())) {
			dbService.setServicecategory(service.getServicecategory());
		}
		try {
			return ResponseEntity.ok(servicesRepo.save(dbService));

		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<String> delete(Services service) {
		try {
			servicesRepo.delete(service);
			return ResponseEntity.ok("Service Deleted Successfully");
		} catch (Exception e) {
			return ResponseEntity.internalServerError().body(e.getMessage());
		}
	}

}
