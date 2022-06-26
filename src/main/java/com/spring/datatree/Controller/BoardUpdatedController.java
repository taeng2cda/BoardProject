package com.spring.datatree.Controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.datatree.Service.BoardService;
import com.spring.datatree.Vo.BoardVo;

@Controller
public class BoardUpdatedController {
	
	@Autowired BoardService service;
	
	
	@PostMapping("/board/ViewUpdatedBoard")
	public String BoardUpdateView(Model model,BoardVo vo, HttpServletRequest req) {
		
		try {
		vo = service.BoardOneSelect(vo.getBnum());
		model.addAttribute("vo",vo);
		}catch (Exception e) {
			System.out.println("BoardUpdated Error : " + e.getMessage());
			model.addAttribute("msg","BoardView 오류 발생");
			model.addAttribute("BoardView","fail");
			return "ViewResult/Result";
		}
		return "board/UpdatedBoard";
	}
	
	
	
	@PostMapping("/board/UpdatedBoard")
	public String BoardUpdate(Model model,BoardVo vo) {
		
		System.out.println(vo.toString());
		try {
			service.BoardUpdated(vo);
			model.addAttribute("msg","게시글 수정이 완료되었습니다.");
			model.addAttribute("BoardUpdated","success");
		}catch (Exception e) {
			System.out.println("게시글 수정 실패 : " + e.getMessage() );
			model.addAttribute("msg","게시글 수정에 실패하였습니다.");
			model.addAttribute("BoardUpdated","fail");
		}
		return "ViewResult/Result";
	}
	
	
}
