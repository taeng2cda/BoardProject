package com.spring.datatree.Controller;

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
public class UsersInsertController {

	@Autowired UsersService service;
	
	
	@GetMapping("/user/insert")
	public ModelAndView UserInsertView() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/InsertUser");
		return mv;
	}
	
	
	@PostMapping("/user/insert")
	public String UserInsert(Model model,UsersVo uvo) {
		
		String userid = uvo.getUserid();
		String pw = uvo.getPw();
		
		// 패스워드를 암호화 해시 하여 vo객체에 다시 넣어줌
		uvo.setPw(MD5.MD5(pw) );
		// 권한 vo객체에 값을 넣어줌
		AuthorityVo avo = new AuthorityVo();
		avo.setUserid(userid);
		avo.setAuthority("member");
		
		try {
		service.UsersInsert(uvo);
		service.AuthorityInsert(avo);
			model.addAttribute("msg","회원가입에 성공했습니다");
			model.addAttribute("UsersInsert","success");
		}catch (Exception e) {
			model.addAttribute("msg","회원가입에 실패하였습니다");
			model.addAttribute("UsersInsert","fail");
			System.out.println("회원가입 에러 : "+ e.getMessage());
		}
		return  "ViewResult/Result";
		
	}
	
}
