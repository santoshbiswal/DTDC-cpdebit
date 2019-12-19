package com.dtdc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dtdc.model.ShipingAddress;
@Repository
public interface ShipingAddressRepo extends CrudRepository<ShipingAddress, Integer> {

}
