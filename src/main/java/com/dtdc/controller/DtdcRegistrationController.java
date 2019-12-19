package com.dtdc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dtdc.command.RegistrationCommand;
import com.dtdc.deligate.DtdcRegistrationDeligate;
import com.dtdc.validator.RegistrationValidator;

@Controller
public class DtdcRegistrationController {

	@Autowired
	private RegistrationValidator validator;
	
	@Autowired
	private DtdcRegistrationDeligate deligate;
	
	@GetMapping("/dtdc-registration.htm")
	public String goToRegistration() {
		
		return "dtdc-resgistration";
	}
	
	
	@ModelAttribute("dtdcRegistration")
	public RegistrationCommand emptyCommandObject() {
		
		return new RegistrationCommand();
	}
	
	@PostMapping("/dtdc-registration.htm")
	public String doRegister(@ModelAttribute("dtdcRegistration")RegistrationCommand command,BindingResult error) {
		
		/* System.out.println(command); */
		
		if(validator.supports(RegistrationCommand.class)) {
			
			validator.validate(command, error);
			if(error.hasErrors()) {
				
				return "dtdc-resgistration";
				
			}
			
		}
		System.out.println(command);
		deligate.register(command);
		return "registration-success";
	}
	
	
}
