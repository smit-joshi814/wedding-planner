package com.wedding.planning.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planning.system.dao.ServiceCategoriesDao;
import com.wedding.planning.system.model.ServiceCategories;
import com.wedding.planning.system.storage.Storage;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class ServicecategoryService {
    @Autowired
    private ServiceCategoriesDao dao;

    @Autowired
    private StorageService service;

    public ResponseEntity<List<ServiceCategories>> getAllServiceCategories() {

        return ResponseEntity.ok().body(dao.findAll().stream()
                .peek(category -> category
                        .setServiceCategoryIcon(service.getImageUrl(category.getServiceCategoryIcon())))
                .collect(Collectors.toList()));
    }

    public ResponseEntity<ServiceCategories> addServiceCategories(String serviceCategoryName, MultipartFile icon,
            boolean isActive) {
        String path = icon.getOriginalFilename();
        try {
            path = service.upload(icon, path, Storage.STORAGE_CATEGORIES);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body(null);
        }

        return ResponseEntity.ok().body(dao.save(ServiceCategories.builder().serviceCategoryName(serviceCategoryName)
                .serviceCategoryIcon(path).isActive(isActive).build()));
    }

    public ResponseEntity<String> deleteServiceCategories(int serviceCategoryId) {
        try {
            service.delete(dao.findById(serviceCategoryId).get().getServiceCategoryIcon());
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

    public ResponseEntity<ServiceCategories> editServiceCategories(Integer serviceCategoryId,
            String serviceCategoryName,
            MultipartFile serviceCategoryIcon, boolean isActive) {

        ServiceCategories dbCategory = dao.findById(serviceCategoryId).get();
        if (Objects.nonNull(isActive)) {
            dbCategory.setActive(isActive);
        }
         if (Objects.nonNull(serviceCategoryName) && !"".equalsIgnoreCase(serviceCategoryName)) {
            dbCategory.setServiceCategoryName(serviceCategoryName);
        }
         if(Objects.nonNull(serviceCategoryIcon) && !"".equalsIgnoreCase(serviceCategoryIcon.getOriginalFilename())) {
            System.err.println("IN SERVICE");
            try {
                dbCategory.setServiceCategoryIcon(service.upload(serviceCategoryIcon, serviceCategoryIcon.getOriginalFilename(), Storage.STORAGE_CATEGORIES));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return ResponseEntity.ok().body(dao.save(dbCategory));
    }
}
