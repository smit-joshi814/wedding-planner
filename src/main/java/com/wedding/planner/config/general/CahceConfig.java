package com.wedding.planner.config.general;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;

import com.wedding.planner.entity.Services;
import com.wedding.planner.service.ServicesService;

import jakarta.annotation.PostConstruct;

@Configuration
@EnableCaching
public class CahceConfig {

	@Autowired
	private CacheManager cacheManager;
	
	@Autowired
	private ServicesService serviceService;
	
	@PostConstruct
	public void preloadCache() {
		Cache cache = cacheManager.getCache("serviceCache");
		List<Services> services = serviceService.getAll().getBody();
		services.forEach(service-> cache.put(service.getServiceId(), service));
	}
	
}
