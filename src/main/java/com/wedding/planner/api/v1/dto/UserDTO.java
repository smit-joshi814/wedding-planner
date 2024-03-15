package com.wedding.planner.api.v1.dto;

public record UserDTO(Long userId,String firstName,String lastName,String email,String phone,String avatar,AddressDTO addressInfo) {

}
