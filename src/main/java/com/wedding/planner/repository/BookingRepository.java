package com.wedding.planner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wedding.planner.entity.Booking;
import com.wedding.planner.entity.Users;

import java.util.List;


public interface BookingRepository extends JpaRepository<Booking, Long>{
	
	List<Booking> findByBookedBy(Users bookedBy);

}
