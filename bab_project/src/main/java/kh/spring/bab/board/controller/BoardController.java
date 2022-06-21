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
	
	
	@GetMapping(value="/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView selectBoard(ModelAndView mv
			, @RequestParam(name="page", defaultValue = "1") int currentPage
			, @RequestParam(name="type", required = false) String type
			, @RequestParam(name="keyword", required = false) String keyword
			, Board board
			) {
		
		System.out.println("type : " + type);
		System.out.println("keyword : " + keyword);
		
		board.setType(type);
		board.setKeyword(keyword);
		
		final int pageSize = 7;
		final int pageBlock = 5;
//		if(board_title.equals("content")) {
//			String board_content = board_title;
//		} else if(board_title.equals("writer")) {
//			String board_writer = board_title;
//		}
		
		List<Board> selectBoard = service.selectBoard(currentPage, pageSize, board);
			
		//int totalCnt = service.selectTotalCnt();
		
		int totalCnt = keyword == "" || keyword == null  ? service.selectTotalCnt() :selectBoard.size();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("selectBoard", selectBoard);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
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
	}
}
