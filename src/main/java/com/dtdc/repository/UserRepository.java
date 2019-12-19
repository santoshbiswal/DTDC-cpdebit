package com.dtdc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dtdc.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

}
