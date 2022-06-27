package com.spring.datatree.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.datatree.Vo.BoardVo;

import data.mybatis.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired private BoardMapper mapper;
	
	public int BoardInsert(HashMap<String,Object> map) {
		return mapper.BoardInsert(map);
	}
	
	public int BoardCount(HashMap<String, Object> map) {
		return mapper.BoardCount(map);
	}
	
	public List<BoardVo> BoardSelectAll(HashMap<String, Object> map1) {
		return mapper.BoardSelectAll(map1);
	}
	
	public BoardVo BoardOneSelect(int bnum) {
		return mapper.BoardOneSelect(bnum);
	}
	
	public int BoardPageCount(int bnum) {
		return mapper.BoardPageCount(bnum);
	}
	
	public int BoardUpdated(BoardVo vo) {
		return mapper.BoardUpdated(vo);
	}
	
	public int BoardDeleted(int bnum) {
		return mapper.BoardDeleted(bnum);
	}
	
}
