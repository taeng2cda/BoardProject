package com.spring.datatree.Filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginFilter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        HttpSession session = request.getSession();
        if(session==null || session.getAttribute("userid")==null){
        	response.sendRedirect("/login");
            return false;
        }

        return true;
	}
	
	
}
