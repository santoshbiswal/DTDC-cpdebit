package com.dtdc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dtdc.command.RegistrationCommand;

@Component
public class RegistrationValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		if(clazz.isAssignableFrom(RegistrationCommand.class))
			return true;
		
		return false;
	}

	public void validate(Object target, Errors errors) {
		
		RegistrationCommand command=(RegistrationCommand)target;
		
		if(command.getAddressLine1()== null || "".equals(command.getAddressLine1()) || command.getAddressLine1().isEmpty()) {
			
			//errors.reject("registration.addressLine1", "addressLine1 should not empty");
			errors.rejectValue("addressLine1", "registration.addressLine1");
		}
	}

	
}
