package com.wedding.planning.system.storage;

import java.io.File;
import java.nio.file.Paths;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Storage {

	public static final String ROOT_DIR = Paths.get("").toAbsolutePath().toString();

	public static final String WEBAPP = ROOT_DIR + File.separator + "src" + File.separator + "main"
			+ File.separator + "webapp"
			+ File.separator;

	public static final String STATIC_DIR = "static" + File.separator;

	public static final String CATEGORY_DIR = STATIC_DIR + "categories" + File.separator;

}
