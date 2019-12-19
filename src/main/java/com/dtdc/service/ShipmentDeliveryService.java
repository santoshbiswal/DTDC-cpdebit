package com.dtdc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dtdc.model.ShipmentDelivery;
import com.dtdc.repository.ShipmentDeliveryRepository;

@Service
public class ShipmentDeliveryService {

	@Autowired
	private ShipmentDeliveryRepository repository;
	
	
	public ShipmentDelivery save(ShipmentDelivery delivery) {
		
		return repository.save(delivery);
	}
}
