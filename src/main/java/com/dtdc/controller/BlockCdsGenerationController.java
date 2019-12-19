package com.dtdc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BlockCdsGenerationController {

	@GetMapping("/go-to-blockcdsgeneration")
	public String goToBlockCdsGeneration() {
		
		return "block-cds-generation";
	}
}
