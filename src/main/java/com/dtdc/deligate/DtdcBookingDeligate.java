package com.dtdc.deligate;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dtdc.command.BookingCommand;
import com.dtdc.model.DtdcCustomer;
import com.dtdc.model.ShipingAddress;
import com.dtdc.model.ShipmentBooking;
import com.dtdc.model.User;
import com.dtdc.repository.UserRepository;
import com.dtdc.service.DtdcCustomerService;
import com.dtdc.service.ShipmentBookingService;
import com.dtdc.service.ShippingAddressService;
import com.dtdc.service.UserService;

@Component
public class DtdcBookingDeligate {

	@Autowired
	private UserService userService;

	@Autowired
	private ShipmentBookingService shipmentBookingService;

	@Autowired
	private DtdcCustomerService dtdcCustomerService;

	@Autowired
	private ShippingAddressService shippingAddressService;

	public boolean doDtdcBooking(BookingCommand command) {

		// save customer
		DtdcCustomer customer = extractDtdcCustomerFromShipmentBookingCommand(command);
		
		DtdcCustomer dtdcCustomer = dtdcCustomerService.saveCustomer(customer);
		
		
		// save from and to address
		ShipingAddress fromAddress = extractShipingAddressFromShipmentAddressCommand(command, dtdcCustomer);
		ShipingAddress toAddress = extractShipingAddressToShipmentAddressCommand(command, dtdcCustomer);

		shippingAddressService.saveAddress(fromAddress);
		shippingAddressService.saveAddress(toAddress);
			
		
		// save booking

		ShipmentBooking booking = extractShipmentBookingFromShipmentBookingCommand(command);

		User user = userService.getUserById(command.getUserId());

		booking.setUser(user);
		booking.setDtdcCustomer(dtdcCustomer);

		ShipmentBooking shipmentBooking = shipmentBookingService.doBookingShipment(booking);

		
		return true;
	}

	
	private DtdcCustomer extractDtdcCustomerFromShipmentBookingCommand(BookingCommand command) {

		DtdcCustomer customer = new DtdcCustomer();

		customer.setName(command.getName());
		customer.setPhone(command.getPhone());
		customer.setEmail(command.getEmail());

		return customer;
	}

	private ShipmentBooking extractShipmentBookingFromShipmentBookingCommand(BookingCommand command) {

		ShipmentBooking booking = new ShipmentBooking();

		booking.setBookingDateTime(command.getDob());
		booking.setBookingParcelType(command.getBookingParcelType());
		booking.setBookingPrice(command.getPrice());
		booking.setDestination(command.getDestination());
		booking.setSource(command.getSource());
		booking.setItemWeight(command.getWeight());
		booking.setQuantity(command.getQuantity());
//		booking.setUser(user);
		booking.setVasProdCod(command.getVasProdCod());

		return booking;
	}

	private ShipingAddress extractShipingAddressToShipmentAddressCommand(BookingCommand command,
			DtdcCustomer customer) {

		ShipingAddress address = new ShipingAddress();

		address.setAddressLine1(command.getToAddressLine1());
		address.setAddressLine2(command.getToAddressLine2());
		address.setCity(command.getToCity());
		address.setCountry(command.getToCountry());
		address.setZip(command.getToZip());

		address.setState(command.getToState());
		address.setAddressType("TO");
		address.setDtdcCustomer(customer);
		return address;
	}

	private ShipingAddress extractShipingAddressFromShipmentAddressCommand(BookingCommand command,
			DtdcCustomer customer) {

		ShipingAddress address = new ShipingAddress();

		address.setAddressLine1(command.getFromAddressLine1());
		address.setAddressLine2(command.getFromAddressLine2());
		address.setCity(command.getFromCity());
		address.setCountry(command.getFromCountry());
		address.setZip(command.getFromZip());

		address.setState(command.getFromState());
		address.setAddressType("FROM");
		address.setDtdcCustomer(customer);
		return address;
	}

}
