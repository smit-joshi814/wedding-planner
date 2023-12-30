package com.wedding.planning.system.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planning.system.storage.Storage;

@Service
public class StorageService {

    public boolean storeFile(MultipartFile file, String path) throws IllegalStateException, IOException {
        Path toStore = Paths.get(Storage.WEBAPP + path);
        file.transferTo(toStore);
        return true;
    }

    public boolean deleteFile(String path) throws Exception {
        String toDelete=Storage.WEBAPP+path;
        File fileToDelete = new File(toDelete);

        if (fileToDelete.exists()) {
            if (fileToDelete.delete()) {
                return true;
            } else {
                throw new Exception("403");
            }
        } else {
            throw new Exception("Error deleting File: File not found");
        }
    }
}
