package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.datatree.Vo.BoardVo;

public interface BoardMapper {
	
	int BoardInsert(BoardVo vo);
	int BoardCount(HashMap<String, Object> map);
	List<BoardVo> BoardSelectAll(HashMap<String, Object> map);
	BoardVo BoardOneSelect(int bnum);
	int BoardPageCount(int bnum);
	int BoardUpdated(BoardVo vo);
	int BoardDeleted(int bnum);
}
