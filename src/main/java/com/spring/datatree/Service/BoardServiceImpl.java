package com.spring.datatree.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.datatree.Vo.BoardVo;
import data.mybatis.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardMapper mapper;
	
	public boolean InsertBoard(BoardVo vo) {
		return mapper.InsertBoard(vo);
	}
}
