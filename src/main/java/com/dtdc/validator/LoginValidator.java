package com.dtdc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dtdc.command.LoginCommand;

@Component
public class LoginValidator implements Validator {

	public boolean supports(Class<?> clazz) {

		if (clazz.isAssignableFrom(LoginCommand.class))
			return true;

		return false;
	}

	public void validate(Object target, Errors errors) {

		LoginCommand command = (LoginCommand) target;

		if (command.getUserName() == null || "".equals(command.getUserName()) || command.getUserName().isEmpty()) {

			errors.rejectValue("userName", "login.userName");
		}

		if ("".equals(command.getUserType())) {

			errors.rejectValue("userType", "login.userType");
		}

	}

}
