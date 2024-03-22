package com.wedding.planner.api.v1.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.wedding.planner.api.v1.dto.AddressDTO;
import com.wedding.planner.api.v1.service.ApiAddressService;
import com.wedding.planner.entity.Address;
import com.wedding.planner.entity.Cities;
import com.wedding.planner.repository.AddressRepository;

@Service
public class ApiAddressServiceImpl implements ApiAddressService {

	@Autowired
	private AddressRepository addressRepository;

	@Override
	public ResponseEntity<AddressDTO> addAddress(AddressDTO addressData) {
		Address address = Address.builder().addressLine1(addressData.addressLine1())
				.addressLine2(addressData.addressLine2())
				.city(Cities.builder().cityId(addressData.cityInfo().cityId()).build()).build();
		return ResponseEntity.ok(convertToDTO(addressRepository.save(address)));
	}

	@Override
	public ResponseEntity<AddressDTO> getAddress(Long addressId) {
		return ResponseEntity.ok(convertToDTO(addressRepository.findById(addressId).get()));
	}

	@Override
	public ResponseEntity<AddressDTO> updateAddress(AddressDTO addressData) {

		Address dbAddress = addressRepository.findById(addressData.addressId()).get();

		if (Objects.nonNull(addressData.addressLine1()) && !"".equalsIgnoreCase("")) {
			dbAddress.setAddressLine1(addressData.addressLine1());
		}

		if (Objects.nonNull(addressData.addressLine2()) && !"".equalsIgnoreCase("")) {
			dbAddress.setAddressLine2(addressData.addressLine2());
		}

		if (Objects.nonNull(addressData.cityInfo().cityId())) {
			dbAddress.setCity(Cities.builder().cityId(addressData.cityInfo().cityId()).build());
		}

		return ResponseEntity.ok(convertToDTO(addressRepository.save(dbAddress)));
	}

	@Override
	public ResponseEntity<Boolean> deleteAddress(Long addressId) {
		try {
			addressRepository.deleteById(addressId);
			return ResponseEntity.ok(true);
		} catch (Exception e) {
			return ResponseEntity.internalServerError().body(false);
		}
	}
}