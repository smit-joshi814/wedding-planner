package com.wedding.planning.system.config;

import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataSourceConfig {
	private final String url = env("SPRING_DATASOURCE_URL");
	private final String username = env("SPRING_DATASOURCE_USERNAME");
	private final String password = env("SPRING_DATASOURCE_PASSWORD");

	private static String env(String name) {
		return System.getenv(name);
	}

	@Bean
	DataSource dataSource() {
		return DataSourceBuilder.create()
				.url(url)
				.username(username)
				.password(password)
				.build();
	}
}
