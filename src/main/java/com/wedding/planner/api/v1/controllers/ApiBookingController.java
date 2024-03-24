package com.wedding.planner.api.v1.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wedding.planner.api.v1.dto.BookingDTO;
import com.wedding.planner.api.v1.service.ApiBookingService;

@RestController
@RequestMapping("/api/v1/booking")
public class ApiBookingController {

	@Autowired
	private ApiBookingService bookingService;

	@GetMapping
	ResponseEntity<List<BookingDTO>> getBookings() {
		return bookingService.getBookings();
	}

	@PostMapping
	ResponseEntity<BookingDTO> addbooking(@RequestBody BookingDTO booking) {
		return bookingService.addBooking(booking);
	}

	@PutMapping
	ResponseEntity<BookingDTO> updateBooking(@RequestBody BookingDTO booking) {
		return bookingService.updatebooking(booking);
	}

	@DeleteMapping("{booking}")
	ResponseEntity<Boolean> deleteBooking(@PathVariable("booking") Long bookingId) {
		return bookingService.deleteBooking(bookingId);
	}
}
