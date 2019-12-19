package com.dtdc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dtdc.model.DtdcCustomer;
import com.dtdc.repository.DtdcCustomerRepository;

@Service
public class DtdcCustomerService {

	@Autowired
	private DtdcCustomerRepository repository;
	
	public DtdcCustomer saveCustomer(DtdcCustomer customer) {
		
		return repository.save(customer);
	}
}
