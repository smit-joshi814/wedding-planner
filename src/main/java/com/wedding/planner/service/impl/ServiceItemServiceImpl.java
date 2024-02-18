package com.wedding.planner.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planner.entity.Images;
import com.wedding.planner.entity.ServiceItem;
import com.wedding.planner.entity.Services;
import com.wedding.planner.repository.ServiceItemRepository;
import com.wedding.planner.service.ServiceItemService;
import com.wedding.planner.service.StorageService;
import com.wedding.planner.utils.Storage;

@Service
public class ServiceItemServiceImpl implements ServiceItemService {

	@Autowired
	private ServiceItemRepository itemRepo;

	@Autowired
	private StorageService storage;

	@Override
	public ResponseEntity<ServiceItem> get(Long serviceItemId) {
		try {
			return ResponseEntity.ok(itemRepo.findById(serviceItemId).get());
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@Override
	public ResponseEntity<List<ServiceItem>> getAll() {
		return ResponseEntity.ok(itemRepo.findAll());
	}

	@Override
	public ResponseEntity<List<ServiceItem>> getAll(Services service) {
		try {
			List<ServiceItem> services = itemRepo.findByService(service);
			if (services.size() == 0) {
				throw new Exception("Not Found");
			}
			return ResponseEntity.ok(services);
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@Override
	public ResponseEntity<ServiceItem> add(String itemName, Services service, Double approxPrice, Boolean status,
			MultipartFile[] itemImages) {
		try {
			List<Images> images = storage.upload(itemImages, itemName, Storage.STORAGE_SERVICE_ITEMS);

			ServiceItem item = ServiceItem.builder().itemName(itemName).service(service).approxPrice(approxPrice)
					.status(status).images(images).build();

			ServiceItem savedItem = itemRepo.save(item);
			return ResponseEntity.ok(savedItem);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().build();
		}
	}

	@Override
	public ResponseEntity<ServiceItem> update(ServiceItem item) {
		try {
			ServiceItem dbItem = itemRepo.findById(item.getServiceItemId()).get();

			if (Objects.nonNull(item.getItemName()) && !"".equalsIgnoreCase(item.getItemName())) {
				dbItem.setItemName(item.getItemName());
			}

			if (Objects.nonNull(item.getApproxPrice())) {
				dbItem.setApproxPrice(item.getApproxPrice());
			}

			if (Objects.nonNull(item.getService())) {
				dbItem.setService(item.getService());
			}

			if (Objects.nonNull(item.getStatus())) {
				dbItem.setStatus(item.getStatus());
			}

			return ResponseEntity.ok(itemRepo.save(dbItem));
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@Override
	public ResponseEntity<String> delete(ServiceItem item) {
		try {
			ServiceItem dbItem = itemRepo.findById(item.getServiceItemId()).get();
			storage.delete(dbItem.getImages());
			itemRepo.delete(dbItem);
			return ResponseEntity.ok("Service Item Deleted Successfully");
		} catch (Exception e) {
			return ResponseEntity.internalServerError().build();
		}
	}
}