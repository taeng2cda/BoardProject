package com.spring.datatree.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardCreatedController {

	
	
	@GetMapping("/authority_user/CreatedBoard")
	public String BoardView(Model model) {
		
		
		return "authority_user/CreatedBoard";
	}

}
