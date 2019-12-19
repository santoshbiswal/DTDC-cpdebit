package com.dtdc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping("/dtdc-home.htm")
	public String goToHome() {
		
		return "dtdc-home";
	}
	
	
	
	
}
