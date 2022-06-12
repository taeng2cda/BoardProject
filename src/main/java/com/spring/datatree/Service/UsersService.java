package com.spring.datatree.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.spring.datatree.Security.CustomUserDetail;
import com.spring.datatree.Vo.UsersVo;
import com.spring.datatree.Vo.Users_AuthorityVo;

import data.mybatis.mapper.UsersMapper;

@Service
public class UsersService {
	
	@Autowired private UsersMapper mapper;
	@Autowired private PasswordEncoder passwordEncoder;
	
	public CustomUserDetail getAuths(String userid) {
		return mapper.getAuths(userid);
	}
	public int UserInsert(UsersVo vo) {
		String pw = vo.getPw();
		vo.setPw(passwordEncoder.encode(pw));
		mapper.UserInsert(vo);
		
		Users_AuthorityVo auth = new Users_AuthorityVo();
		auth.setUserid(vo.getUserid());
		
		if(vo.getUserid().equals("admin")) {
			auth.setAuthority("ROLE_ADMIN");
			mapper.AuthInsert(auth);
			auth.setAuthority("ROLE_MEMBER");
			mapper.AuthInsert(auth);
		}else {
			auth.setAuthority("ROLE_MEMBER");
			mapper.AuthInsert(auth);
		}
		return 1;
		
	}
	public int AuthInsert(Users_AuthorityVo vo) {
		return mapper.AuthInsert(vo);
	}
}
