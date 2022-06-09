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
	//@Autowired private PasswordEncoder pwec;
	
	public CustomUserDetail hetAuths(String userid) {
		return mapper.getAuths(userid);
	}
	public int UserInsert(UsersVo vo) {
		return mapper.UserInsert(vo);
	}
	public int AuthInsert(Users_AuthorityVo vo) {
		return mapper.AuthInsert(vo);
	}
}
