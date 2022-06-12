package kh.spring.bab.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.board.model.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	@GetMapping("/insert")
	public ModelAndView insertBoard(ModelAndView mv
			) {
		
		mv.setViewName("board/insert");
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertDoBoard(ModelAndView mv
			) {
		
		mv.setViewName("board/insert");
		return mv;
	}
	
	
	@GetMapping("/select")
	public ModelAndView selectBoard(ModelAndView mv) {
		
		mv.setViewName("board/select");
		
		return mv;
	}
}
