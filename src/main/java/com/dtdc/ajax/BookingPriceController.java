package com.dtdc.ajax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dtdc.service.ShipmentBookingService;

@RestController
public class BookingPriceController {

	@Autowired
	private ShipmentBookingService service;
	
	@PostMapping("/api/find-price")
	public ResponseEntity<?> getBookingPrice(@RequestBody BookingPriceSearchCriteria criteria) {
		
//		System.out.println();
		Integer price=service.getPriceBySourceAndDestination(criteria.getSource(), criteria.getDestination());
		
		System.out.println(" Price : "+price);
		BookingPriceReponse bookingPriceReponse=new BookingPriceReponse();
		bookingPriceReponse.setPrice(price);
		
		return ResponseEntity.ok(bookingPriceReponse);
		
				
		
	}
}
