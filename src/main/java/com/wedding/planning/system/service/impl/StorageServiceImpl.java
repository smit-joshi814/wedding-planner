package com.wedding.planning.system.service.impl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wedding.planning.system.service.StorageService;

import io.imagekit.sdk.ImageKit;
import io.imagekit.sdk.exceptions.BadRequestException;
import io.imagekit.sdk.exceptions.ForbiddenException;
import io.imagekit.sdk.exceptions.InternalServerException;
import io.imagekit.sdk.exceptions.TooManyRequestsException;
import io.imagekit.sdk.exceptions.UnauthorizedException;
import io.imagekit.sdk.exceptions.UnknownException;
import io.imagekit.sdk.models.FileCreateRequest;
import io.imagekit.sdk.models.results.Result;

@Service
public class StorageServiceImpl implements StorageService {

	@Autowired
	private ImageKit imageKit;

	@Override
	public String upload(MultipartFile file, String name, String FOLDER_NAME) throws IOException {

		try {
			FileCreateRequest request = new FileCreateRequest(file.getBytes(), name);
			request.folder = FOLDER_NAME;
			Result response = imageKit.upload(request);
			return response.getFileId() + "," + response.getUrl();
		} catch (InternalServerException | BadRequestException | UnknownException | ForbiddenException
				| TooManyRequestsException | UnauthorizedException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public String getImageUrl(String fileId) {
		try {
			return imageKit.getFileDetail(fileId).getUrl();
		} catch (ForbiddenException | TooManyRequestsException | InternalServerException | UnauthorizedException
				| BadRequestException | UnknownException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public boolean delete(String fileId) {
		try {
			imageKit.deleteFile(fileId);
			return false;
		} catch (ForbiddenException | TooManyRequestsException | InternalServerException | UnauthorizedException
				| BadRequestException | UnknownException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
