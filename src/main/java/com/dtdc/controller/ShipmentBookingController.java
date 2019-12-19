package com.dtdc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.convert.Delimiter;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dtdc.command.BookingCommand;
import com.dtdc.deligate.DtdcBookingDeligate;
import com.dtdc.model.ShipmentBooking;
import com.dtdc.service.ShipmentBookingService;

@Controller
public class ShipmentBookingController {

	
	@RequestMapping("/shipment-booking.htm")
	public String goToShipmentBooking() {
		
		return "shipment-booking";
	}
	
	@ModelAttribute("bookingCommand")
	public BookingCommand createEmptyCommand() {
		
		return new BookingCommand();
	}
	
	@Autowired
	private DtdcBookingDeligate deligate;
	
	@PostMapping("/shipment-booking.htm")
	public String doBooking(@ModelAttribute("bookingCommand")BookingCommand command,BindingResult errors) {
		
		
		
		//System.out.println(command);
		deligate.doDtdcBooking(command);
		
		
		return "registration-success";
	}
	

}
