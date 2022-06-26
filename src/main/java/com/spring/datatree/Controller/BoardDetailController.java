package com.spring.datatree.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping("/board/boarddetail")
	public String BoardDetailView(Model model,BoardVo vo ,HttpServletResponse resp,HttpServletRequest req) throws IOException {
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		System.out.println("userid : " + userid);
		if(userid == null) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter(); 
						out.println("<script>");
						out.println("alert('로그인이 필요합니다');");
						out.println("location.href='"+req.getContextPath()+"/logout';"); 
						out.println("</script>");
						out.close(); 
						return "home";
		}
		
		
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
	
	
	@PostMapping("/board/DeletedBoard")
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
