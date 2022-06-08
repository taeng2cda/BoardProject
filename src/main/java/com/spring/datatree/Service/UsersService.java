package com.spring.datatree.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.datatree.Vo.UsersVo;

import data.mybatis.mapper.UsersMapper;

@Service
public class UsersService {
	
	@Autowired private UsersMapper mapper;
	
	public int UserInsert(UsersVo vo) {
		return mapper.InsertUser(vo);
	}
}
