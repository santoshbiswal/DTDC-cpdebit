package com.dtdc.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dtdc.exception.UserNotFoundException;
import com.dtdc.model.User;
import com.dtdc.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository repository;

	public User saveUser(User user) {

		return repository.save(user);
	}
	
	public User getUserById(int userId) {
		
		Optional<User> option= repository.findById(userId);
		
		if(option.isPresent()) {
			
			return option.get();
		}
		
		throw new UserNotFoundException(userId+" : is not present in database");
	}

}
