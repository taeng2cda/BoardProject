package com.spring.datatree.Controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.spring.datatree.Service.UsersService;
import com.spring.datatree.Util.MD5;
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
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody Object Login(@RequestBody HashMap<String,String> loginMap,HttpServletRequest req,Model model )throws Exception {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("userid") != null) {
			session.removeAttribute("userid");
		}
		System.out.println("TEST");
		String password = loginMap.get("pw");
		String pw = MD5.MD5(password);
		loginMap.replace("pw", pw);
		
		try {
			UsersVo vo = service.UsersLogin(loginMap);
			
			if(vo != null) {
				session.setAttribute("userid", vo.getUserid());
				
				return 1;
			}else {
				return 0;
			}
			
		}catch (Exception e) {
			System.out.println("로그인 에러 : "+e.getMessage());
			return 9;
		}
		
	}
//	@PostMapping("/login")
//	public String Login(Model model,UsersVo vo,HttpServletRequest req) throws Exception {
//		
//		String userid = vo.getUserid();
//		String pw = MD5.MD5(vo.getPw());
//		vo.setPw(pw);
//		System.out.println(vo.toString());
//		HttpSession session = req.getSession();
//		UsersVo uvo = service.UsersLogin(vo);
//		AuthorityVo avo = service.SelectAuthority(userid);
//		
//		
//		if(uvo != null) {
//			
//			session.setAttribute("userid",vo.getUserid() );
//			session.setAttribute("authority", avo.getAuthority());
//			
//			model.addAttribute("Login","success");
//			
//		}else {
//			
//			model.addAttribute("msg","아이디 또는 비밀번호가 틀립니다.");
//			model.addAttribute("Login","fail");
//		}
//		
//		
//		return "ViewResult/Result";
//	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		
		return "redirect:/";
	}
	


}
