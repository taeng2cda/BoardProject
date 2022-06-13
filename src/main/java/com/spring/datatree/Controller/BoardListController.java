package com.spring.datatree.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardListController {
	
	//오토와이어드
	
	@GetMapping("/board")
	public String BoardView() {
		
		
		
		
		return "board/ListBoard";
	}

}
