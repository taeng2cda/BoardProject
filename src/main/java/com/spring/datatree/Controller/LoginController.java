package com.spring.datatree.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.datatree.Service.UsersService;
import com.spring.datatree.Util.MD5;
import com.spring.datatree.Vo.AuthorityVo;
import com.spring.datatree.Vo.UsersVo;

@Controller
public class LoginController {
	
	@Autowired UsersService service;
	
	
	@GetMapping("/login")
	public ModelAndView LoginView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@PostMapping("/login")
	public String Login(Model model,UsersVo vo,HttpServletRequest req) throws Exception {
		
		String userid = vo.getUserid();
		String pw = MD5.MD5(vo.getPw());
		vo.setPw(pw);
		System.out.println(vo.toString());
		HttpSession session = req.getSession();
		UsersVo uvo = service.UsersLogin(vo);
		AuthorityVo avo = service.SelectAuthority(userid);
		

		if(uvo != null) {
			
			session.setAttribute("userid",vo.getUserid() );
			session.setAttribute("authority", avo.getAuthority());
			
			model.addAttribute("Login","success");
			
		}else {
			
			model.addAttribute("msg","아이디 또는 비밀번호가 틀립니다.");
			model.addAttribute("Login","fail");
		}
		
		
		return "ViewResult/Result";
	}
	


}
