package com.wedding.planning.system.config;

import org.springframework.beans.factory.annotation.Value;

import io.imagekit.sdk.ImageKit;

public class ImageKitConf {

	@Value("${imagekit.api-public}")
	private static String publicKey = env("IMGKIT_API_PUBLIC");

	@Value("${imagekit.api-private}")
	private static String privateKey = env("IMGKIT_API_PRIVATE");

	@Value("${imagekit.url-endpoint}")
	private static String urlEndPoint = env("IMGKIT_API_ENDPOINT");

	private static String env(String name) {
		return System.getenv(name);
	}

	public static ImageKit getImageKitConf() {
		ImageKit imageKit = ImageKit.getInstance();
		imageKit.setConfig(new io.imagekit.sdk.config.Configuration(publicKey, privateKey, urlEndPoint));
		return imageKit;
	}

}
