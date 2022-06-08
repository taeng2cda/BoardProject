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
		mv.setViewName("User/Login");
		return mv;
	}
	
	

}
