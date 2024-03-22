package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.EmergencyContacts;

public interface EmergencyContactsRepository extends JpaRepository<EmergencyContacts, Long>{

}
