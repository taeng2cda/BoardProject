package com.spring.datatree.Service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.datatree.Vo.AuthorityVo;
import com.spring.datatree.Vo.UsersVo;
import data.mybatis.mapper.UsersMapper;

@Service
public class UsersService {
	
	@Autowired private UsersMapper usersmapper;
	
	public int UsersInsert(UsersVo vo) {
		return usersmapper.UsersInsert(vo);
	}
	
	public int AuthorityInsert(AuthorityVo vo) {
		return usersmapper.AuthorityInsert(vo);
	}
	
	public UsersVo UsersLogin(HashMap<String, String> map) {
		return usersmapper.UsersLogin(map);
	}
	public AuthorityVo SelectAuthority(String userid) {
		return usersmapper.SelectAuthority(userid);
	}

}
