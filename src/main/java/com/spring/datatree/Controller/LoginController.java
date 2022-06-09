package com.spring.datatree.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="login",method=RequestMethod.GET)
	public ModelAndView UserLoginView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String test() {
		return "home";
	}
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String UserLogout() {
		return "logout";
	}

}
