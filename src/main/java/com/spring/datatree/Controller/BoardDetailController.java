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
public class BoardDetailController {
	
	@Autowired BoardService service;
	
	@GetMapping("/authority_user/boarddetail")
	public String BoardDetailView(Model model,BoardVo vo,Principal principal) {
		String userid = principal.getName();
		model.addAttribute("userid",userid);
		int bnum = vo.getBnum();
		
		try {
			service.BoardPageCount(bnum);
			vo =service.BoardOneSelect(bnum);
			model.addAttribute("vo", vo);
		}catch (Exception e) {
			System.out.println("BoardDetail Controller Error : "+ e.getMessage());
			model.addAttribute("msg","Board/Detail 오류가 발생하였습니다");
			model.addAttribute("BoardDetail","fail");
			return "ViewResult/Result";
		}
		return "board/DetailBoard";
	}
	
	
	@PostMapping("/authority_user/DeletedBoard")
	public String BoardDeleted(Model model,BoardVo vo,Principal principal) {
		
		try {
			service.BoardDeleted(vo.getBnum());
			model.addAttribute("BoardDelete","success");
		}catch (Exception e) {
			model.addAttribute("msg","Board/Delete 오류가 발생하였습니다.");
			model.addAttribute("BoardDelete","fail");
		}
		
		return "ViewResult/Result";
	}
	
	
	

}
