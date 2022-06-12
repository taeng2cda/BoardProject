package com.spring.datatree.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.datatree.Service.UsersService;
import com.spring.datatree.Vo.UsersVo;

@Controller
public class UserInsertController {

	@Autowired UsersService service;
	
	@RequestMapping(value = "/user/insert", method = RequestMethod.GET)
	public ModelAndView ViewPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/InsertUser");
		return mv;
	}
	
	
	@RequestMapping(value = "/user/insert", method = RequestMethod.POST)
	public ModelAndView InsertUser(UsersVo vo,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewResult/Result");
		System.out.println(vo.toString());
		
		try {
			service.UserInsert(vo);
			model.addAttribute("UserInsert","success");
		}catch(Exception e) {
			System.out.println("회원가입 실패 : " + e.getMessage() );
			model.addAttribute("UserInsert","fail");
		}
		
		return mv;
	}
}
