package com.dtdc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dtdc.model.DtdcCustomer;

@Repository
public interface DtdcCustomerRepository extends CrudRepository<DtdcCustomer, Integer> {

}
