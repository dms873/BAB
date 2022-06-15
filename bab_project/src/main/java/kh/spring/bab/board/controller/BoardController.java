package kh.spring.bab.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.board.model.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	@GetMapping("/insert")
	public ModelAndView insert(ModelAndView mv
			) {
		
		mv.setViewName("board/insert");
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertDo(ModelAndView mv
			, Board board
			) {
		
		//login session 받아오기
		String writer = "이대표";
		board.setBoard_writer(writer);
		
		int result = service.insertBoard(board);
		
		mv.setViewName("redirect:/board/select");
		return mv;
	}
	
	@GetMapping("/view")
	public ModelAndView viewBoard(ModelAndView mv) {
		
		mv.setViewName("board/selectOne");
		
		return mv;
	}
	
	
	@GetMapping("/select")
	public ModelAndView selectBoard(ModelAndView mv) {
		
		mv.addObject("selectBoard", service.selectBoard());
		mv.setViewName("board/select");
		
		return mv;
	}
	
	@GetMapping("/update")
	public ModelAndView updateBoard(ModelAndView mv) {
		
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("/view")
	public ModelAndView viewBoardDo(ModelAndView mv) {
		
		mv.setViewName("board/selectOne");
		
		return mv;
	}
}
