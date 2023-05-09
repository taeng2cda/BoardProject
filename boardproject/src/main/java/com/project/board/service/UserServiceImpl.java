package com.project.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board.dto.UserDTO;
import com.project.board.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired 
	private UserMapper userMapper;

	@Override
	public UserDTO getUser(UserDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUser(dto);
	}

	
}
