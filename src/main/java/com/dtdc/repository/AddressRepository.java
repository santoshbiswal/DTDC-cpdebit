package com.dtdc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dtdc.model.Address;

@Repository
public interface AddressRepository extends CrudRepository<Address, Integer>{

}
