package com.wedding.planning.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.wedding.planning.system.dao.ServiceCategoriesDao;
import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.storage.Storage;

@Service
public class ServicecategoryService {
    @Autowired
    private ServiceCategoriesDao dao;

    @Autowired
    private StorageService service;

    public ResponseEntity<List<ServiceCategories>> getAllServiceCategories() {
        return ResponseEntity.ok().body(dao.findAll());
    }

    public ResponseEntity<ServiceCategories> addServiceCategories(String serviceCategoryName, MultipartFile icon,
            boolean isActive) {
        String path = Storage.CATEGORY_DIR + UUID.randomUUID() + icon.getOriginalFilename();

        try {
            service.storeFile(icon, path);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body(null);
        }

        return ResponseEntity.ok().body(dao.save(ServiceCategories.builder()
                .serviceCategoryName(serviceCategoryName)
                .serviceCategoryIcon(path.toString())
                .isActive(isActive)
                .build()));

    }

    public ResponseEntity<String> deleteServiceCategories(int serviceCategoryId) {
        try {
            service.deleteFile(dao.findById(serviceCategoryId).get().getServiceCategoryIcon());
            dao.deleteById(serviceCategoryId);
            return ResponseEntity.ok().body("File Deleted Successfully");
        } catch (Exception e) {
            if (e.getMessage().equals("403")) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Error deleting File: Permission Denied");
            } else {
                dao.deleteById(serviceCategoryId);
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
            }
        }
    }

}
