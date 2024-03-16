package com.wedding.planner.api.v1.service;

import org.springframework.http.ResponseEntity;

import com.wedding.planner.api.v1.auth.SignUpRequest;
import com.wedding.planner.api.v1.dto.AddressDTO;
import com.wedding.planner.api.v1.dto.CityDTO;
import com.wedding.planner.api.v1.dto.UserDTO;
import com.wedding.planner.entity.Address;
import com.wedding.planner.entity.Cities;
import com.wedding.planner.entity.Users;

public interface ApiUserService {

	/**
	 * converts to CityDTO
	 *
	 * @param city
	 * @return
	 */
	private CityDTO convertCity(Cities city) {
		return new CityDTO(city.getCityId(), city.getCityName());
	}

	/**
	 * Converts to AddressDTO
	 *
	 * @param address
	 * @return
	 */
	private AddressDTO convertAddress(Address address) {
		return new AddressDTO(address.getAddressId(), address.getAddressLine1(), address.getAddressLine2(),
				convertCity(address.getCity()));
	}

	/**
	 * Returns User Related data
	 *
	 * @param user
	 * @return
	 */
	default UserDTO convertToDTO(Users user) {
		return new UserDTO(user.getUserId(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhone(),
				user.getAvatar() != null ? user.getAvatar().getUrl()
						: "https://ik.imagekit.io/weddingplanning/defaults/Wedding%20Planner",
				user.getAddress().size() != 0 ? convertAddress(user.getAddress().get(0)) : null);
	}

	/**
	 * adds user
	 *
	 * @param user
	 * @return
	 */
	ResponseEntity<Boolean> registerUser(SignUpRequest request);

	/**
	 * gets current logged in user
	 *
	 * @return
	 */
	ResponseEntity<UserDTO> getUser();

	/**
	 * updates User
	 *
	 * @param user
	 * @return
	 */
	ResponseEntity<UserDTO> updateUser(UserDTO user);

	/**
	 * delete User
	 *
	 * @param user
	 * @return
	 */
	ResponseEntity<Boolean> deleteUser();

}
