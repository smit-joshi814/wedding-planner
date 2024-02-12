package com.wedding.planning.system.service;

//import com.wedding.planning.system.config.ImageKitConf;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

	String upload(MultipartFile file, String name, String FOLDER_NAME) throws IOException;

	String getImageUrl(String fileId);

	boolean delete(String fileId);
}
