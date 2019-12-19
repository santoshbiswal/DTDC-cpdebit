package com.dtdc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dtdc.model.Address;
import com.dtdc.repository.AddressRepository;

@Service
public class AddressService {
	
	@Autowired
	private AddressRepository repository;
	
	public boolean saveAddress(Address address) {
		
		Address address2=repository.save(address);
		
		System.out.println("Address ID : "+address2.getAddressId());
		
		return true;
		
	}
}
