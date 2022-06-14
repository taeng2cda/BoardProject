package com.spring.datatree.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.datatree.Service.BoardService;
import com.spring.datatree.Vo.BoardVo;

@Controller
public class BoardCreatedController {
	
	@Autowired BoardService service;

	@GetMapping("/authority_user/CreatedBoard")
	public String BoardView(Model model,Principal principal) {
		String userid = principal.getName();
		
		model.addAttribute("userid",userid);
		return "board/CreatedBoard";
	}
	
	@PostMapping("/authority_user/CreatedBoard")
	public String BoardCreated(Model model,BoardVo vo) {
		
		System.out.println(vo.toString());
		vo.setCount(0);
		
		try {
			service.BoardInsert(vo);
			model.addAttribute("msg","정상등록 되었습니다");
			model.addAttribute("BoardInsert","success");
		
		}catch(Exception e) {
			System.out.println("게시판 생성 실패 : "+ e.getMessage());
			model.addAttribute("msg","게시글 생성에 실패하였습니다");
			model.addAttribute("BoardInsert","fail");
		}
		return "ViewResult/Result";
	}

}
