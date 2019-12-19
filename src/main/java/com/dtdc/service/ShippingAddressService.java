package com.dtdc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dtdc.model.ShipingAddress;
import com.dtdc.repository.ShipingAddressRepo;

@Service
public class ShippingAddressService {

	@Autowired
	private ShipingAddressRepo addressRepo;
	
	
	public ShipingAddress saveAddress(ShipingAddress address) {
		return addressRepo.save(address);
	}
}
