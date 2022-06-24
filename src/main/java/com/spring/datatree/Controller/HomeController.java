package com.spring.datatree.Controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.datatree.Service.UsersService;
import com.spring.datatree.Vo.AuthorityVo;
import com.spring.datatree.Vo.UsersVo;


@Controller
public class HomeController {
	
	@Autowired UsersService service;

	@RequestMapping(value="/",method=RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping(value="/test")
	public String Test() {

		return "test/test";
	}
	
	
	@RequestMapping(value="/test",method=RequestMethod.POST,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String,String> test(String userid) {
		
		System.out.println("userid : " + userid);
		//Gson gson = new Gson();
		
		AuthorityVo vo =  service.SelectAuthority(userid);
		System.out.println("ToString : "+vo.toString());
		
//		JsonObject ob = new JsonObject();
//		ob.addProperty("userid", vo.getUserid());
//		ob.addProperty("authority", vo.getAuthority());
//		
//
//		String json = gson.toJson(ob);
//		
//		System.out.println("JSON ToString : "+json.toString());
		
		HashMap<String,String> map1 = new HashMap<String,String>();
		map1.put("userid", vo.getUserid());
		map1.put("authority", vo.getAuthority());
		
		return map1;
		
	}
	
	
}
