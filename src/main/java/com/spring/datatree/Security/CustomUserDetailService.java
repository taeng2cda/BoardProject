package com.spring.datatree.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.datatree.Service.UsersService;

public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired private UsersService service;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetail UD = service.getAuths(username);
		return UD;
	}
	
	
	
}
