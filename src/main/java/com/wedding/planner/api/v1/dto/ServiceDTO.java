package com.wedding.planner.api.v1.dto;

import java.util.Objects;

public record ServiceDTO(Long serviceId, Long createdBy, String serviceName, String serviceDescription,
		String serviceLocation, String serviceImage) {
	public ServiceDTO {
		Objects.requireNonNull(serviceId, "service id require");
		Objects.requireNonNull(createdBy, "required created By");
		Objects.requireNonNull(serviceName, "service name require");
		Objects.requireNonNull(serviceDescription, "service description require");
		Objects.requireNonNull(serviceLocation, "service location require");
	}
}
