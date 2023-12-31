package com.wedding.planning.system.service;

import io.imagekit.sdk.ImageKit;
import io.imagekit.sdk.exceptions.BadRequestException;
import io.imagekit.sdk.exceptions.ForbiddenException;
import io.imagekit.sdk.exceptions.InternalServerException;
import io.imagekit.sdk.exceptions.TooManyRequestsException;
import io.imagekit.sdk.exceptions.UnauthorizedException;
import io.imagekit.sdk.exceptions.UnknownException;
import io.imagekit.sdk.models.FileCreateRequest;
import io.imagekit.sdk.models.results.Result;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public class StorageService {

	@Value("${imagekit.api-public}")
	private String publicKey= env("IMGKIT_API_PUBLIC");

	@Value("${imagekit.api-private}")
	private String privateKey = env("IMGKIT_API_PRIVATE");

	@Value("${imagekit.url-endpoint}")
	private String urlEndPoint = env("IMGKIT_API_ENDPOINT");


		
	private static String env(String name) {
		return System.getenv(name);
	}


	public String upload(MultipartFile file, String name, String FOLDER_NAME) throws IOException {

		try {
			ImageKit imageKit = getImageKit();
			FileCreateRequest request = new FileCreateRequest(file.getBytes(), name);
			request.folder = FOLDER_NAME;
			Result response = imageKit.upload(request);
			return response.getFileId();
		} catch (InternalServerException | BadRequestException | UnknownException | ForbiddenException
				| TooManyRequestsException | UnauthorizedException | IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public String getImageUrl(String fileId) {
		try {
			ImageKit imageKit = getImageKit();
			return imageKit.getFileDetail(fileId).getUrl();
		} catch (ForbiddenException | TooManyRequestsException | InternalServerException | UnauthorizedException
				| BadRequestException | UnknownException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public boolean delete(String fileId) {
		try {
			ImageKit imageKit = getImageKit();
			imageKit.deleteFile(fileId);
			return false;
		} catch (ForbiddenException | TooManyRequestsException | InternalServerException | UnauthorizedException
				| BadRequestException | UnknownException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	private ImageKit getImageKit() {
		ImageKit imageKit = ImageKit.getInstance();
		imageKit.setConfig(new io.imagekit.sdk.config.Configuration(publicKey, privateKey, urlEndPoint));
		return imageKit;
	}
}
