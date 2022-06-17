package com.spring.datatree.Controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.datatree.Service.BoardService;
import com.spring.datatree.Util.PageUtil;
import com.spring.datatree.Vo.BoardVo;

@Controller
public class BoardListController {
	@Autowired private BoardService service;
	
	@RequestMapping("/board")
	public String BoardView(@RequestParam(value="pageNum", defaultValue = "1") int pageNum,
			String field,
			String keyword,
			Model model) {
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword", keyword);
		
		int totalRowCOunt = service.BoardCount(map);
		PageUtil pu = new PageUtil(pageNum, 10,10, totalRowCOunt);
		
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<BoardVo> boardlist = service.BoardSelectAll(map);
	    model.addAttribute("field",field);
	    model.addAttribute("keyword", keyword);
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("pu",pu);
		
		
		return "board/ListBoard";
	}

}
