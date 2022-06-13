package com.spring.datatree.Controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@Autowired ServletContext servletContext;
	
	@GetMapping("/login/View")
	public String loginView(HttpServletRequest request, Model model, Authentication authentication) {
		String uri = request.getHeader("Referer"); //이전 경로
		
		return "login";
	}

	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("msg", "로그인이 필요한 페이지입니다!");
		model.addAttribute("url", servletContext.getContextPath() + "/?login=true");
		return "alert";
	}
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}

}
