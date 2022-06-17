package kh.spring.bab.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@PostMapping(value="/insert", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertDo(
			 Board board
			, @RequestParam(name="board_title", required = false) String board_title
			, @RequestParam(name="board_writer", required = false) String board_writer
			, @RequestParam(name="board_content", required = false) String board_content
			) {
		System.out.println(board_title + board_writer + board_content);
		//login session 받아오기
		
		board.setBoard_title(board_title);
		board.setBoard_writer(board_writer);
		board.setBoard_content(board_content);
		
		int result = service.insertBoard(board);
		
		String msg = "";
		if(result > 0) {
			msg = "게시글 등록에 성공하였습니다.";
		} else {
			msg = "게시글 등록에 실패하였습니다.";
		}
		return msg;
	}
	
	@GetMapping("/read")
	public ModelAndView read(ModelAndView mv
			, @RequestParam(name="board_no", required = false) String board_no
			, RedirectAttributes rttr
			) {
		
		System.out.println("board_no : "+board_no );
		if(board_no == null) {
			rttr.addFlashAttribute("msg", "번호가 없습니다. 다시 선택해주세요.");
			mv.setViewName("redirect:/board/select");
		}
		mv.addObject("readBoard", service.readBoard(board_no));
		
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
	public ModelAndView update(ModelAndView mv
			, @RequestParam(name="board_no", required = false) String board_no
			) {
		
		mv.addObject("updateBoard", service.readBoard(board_no));
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView updateDo(ModelAndView mv
			, Board board
			, RedirectAttributes rttr
			) {
		
		int result = service.updateBoard(board);
		if(result > 0) {
			rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
		} else {
			rttr.addFlashAttribute("msg", "수정에 실패했습니다.");
		}
		mv.setViewName("board/view");
		
		return mv;
	}
	
	@PostMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(HttpServletRequest request
			, RedirectAttributes rttr
			) {
		
		String[] board_no = request.getParameterValues("valueArr");
		System.out.println("board_no : " + board_no);
		
		int size = board_no.length;
		System.out.println("size : " + size);
		
		int result = 0;
		
		for(int i=0; i<size; i++) {
			result = service.deleteBoard(board_no[i]);
			System.out.println("result : " + result);
		}
		
		String msg = "";
		if(result > 0) {
			msg = "게시글 삭제에 성공하였습니다.";
		} else {
			msg = "게시글 삭제에 실패하였습니다.";
		}
		return msg;
		
//		int result = service.updateBoard(board);
//		if(result > 0) {
//			rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
//		} else {
//			rttr.addFlashAttribute("msg", "수정에 실패했습니다.");
//		}
//		
//		return mv;
	}
}
