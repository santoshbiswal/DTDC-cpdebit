package com.dtdc.deligate;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dtdc.command.RegistrationCommand;
import com.dtdc.model.Address;
import com.dtdc.model.Login;
import com.dtdc.model.User;
import com.dtdc.service.AddressService;
import com.dtdc.service.LoginService;
import com.dtdc.service.UserService;

@Component
public class DtdcRegistrationDeligate {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LoginService loginService;
	
	 public boolean register(RegistrationCommand command) {
		 
		 User u1=extractUserFromCommand(command);
		 Address  a1=extractAddressFromCommand(command);
		 Login login=extractLoginFromCommand(command);
		 
		 
		 
		
		// Set<Address> addresses=new HashSet<Address>();
		 
		 //addresses.add(a1);
		 
		 //u1.setAddresses(addresses);
		 
		
//		 u1.setLogin(login);
		 User user=userService.saveUser(u1);
		 
		 login.setUser(u1);
		 loginService.saveLogin(login);
		 
		 System.out.println(user);
		 
		 a1.setUser(user);
		 addressService.saveAddress(a1);
		 
		 return true;
	 }
	 
	 
	 private Login extractLoginFromCommand(RegistrationCommand command) {
		 
		 Login login=new Login();
		 
		 login.setUserName(command.getUserName());
		 login.setPassword(command.getPassword());
		 login.setRole("USER");
		 login.setUserType(command.getUserType());
		 
		 return login;
	 }
	 private User extractUserFromCommand(RegistrationCommand command) {
		 
		 User user=new User();
		 
		 user.setName(command.getName());
		 user.setPhone(command.getPhone());
		 user.setEmail(command.getEmail());
		 user.setDob(command.getDob());
		 
		 
		 return user;
	 }
	 private Address extractAddressFromCommand(RegistrationCommand command) {
		 
		 Address address=new Address();
		 
		 address.setAddressLine1(command.getAddressLine1());
		 address.setAddressLine2(command.getAddressLine2());
		 address.setCity(command.getCity());
		 address.setState(command.getState());
		 address.setCountry(command.getCountry());
		 address.setZip(command.getZip());
		 
		 return address;
		 
		 
	 }
		
}
