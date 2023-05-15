package com.project.board.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.service.UserService;

import jakarta.annotation.Resource;

@RestController()
public class UserController {
	
	@Resource
	private UserService boardService;
	
	
	@RequestMapping(value = "/user/join" , method = RequestMethod.GET)
	public ModelAndView CreateUser( )throws Exception{
		System.out.println("@@@");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
	
	
}
