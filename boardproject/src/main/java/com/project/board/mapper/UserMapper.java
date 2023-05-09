package com.project.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.board.dto.UserDTO;

@Mapper
public interface UserMapper {

	public UserDTO getUser(UserDTO dto) throws Exception;
	
}
