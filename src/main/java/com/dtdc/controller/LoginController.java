package com.dtdc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.dtdc.command.LoginCommand;
import com.dtdc.exception.UserNotFoundException;
import com.dtdc.service.LoginService;
import com.dtdc.validator.LoginValidator;

@Controller
public class LoginController {

	@Autowired
	private LoginValidator validator;
	
	@Autowired
	private LoginService service;
	
	@GetMapping("/sign-in.htm")
	public String goToLogin() {
		
		return "sign-in";
	}
	
	@ModelAttribute("loginCommand")
	public LoginCommand emptyLoginCommandObject() {
		
		return new LoginCommand();
	}
	
	@PostMapping("/sign-in.htm")
	public String doLogin(HttpSession session,@ModelAttribute("loginCommand")LoginCommand command,BindingResult errors) {
		
		if(validator.supports(LoginCommand.class)) {
			
			validator.validate(command, errors);
			
			
			if(errors.hasErrors()) {
				
				return "sign-in";
			}
		}
		
		try {
			
			Integer userId=service.validateLogin(command);
			
			session.setAttribute("userId", userId);
			session.setAttribute("userName",command.getUserName());
			session.setAttribute("password",command.getPassword());
			
		}catch(UserNotFoundException e){
			
			//errors.rejectValue("userName", "login.invalid");
			errors.reject("userName",e.getMessage());
			return "sign-in";
		}
		
		if(command.getUserType().equals("channel-pattner")) {
			return "channel-pattner-dashboard";
		}
		if(command.getUserType().equals("delivery-pattner")) {
			return "delivery-pattner-dashboard";
		}
		
		if(command.getUserType().equals("corporate")) {
			return "block-cds-generation";
		}
		return "registration-success";
	}
	
	@GetMapping("/logout.htm")
	public String doLlogout(HttpSession session) {
		
		Integer userId=(Integer) session.getAttribute("userId");
		String userNmae=(String) session.getAttribute("userName");
		
		System.out.println("userNmae "+userNmae);
		session.invalidate();
		
		
		
		return "sign-in";
	}
}
