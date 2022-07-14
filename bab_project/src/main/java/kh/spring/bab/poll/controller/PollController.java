package kh.spring.bab.poll.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.poll.domain.Poll;
import kh.spring.bab.poll.model.service.PollServiceImpl;


@Controller
@RequestMapping("poll")
public class PollController {
	
	@Autowired
	private PollServiceImpl service;
	
	// 투표 조회 페이지열기
	@GetMapping("/select")
	public ModelAndView pageselect(ModelAndView mv, HttpServletRequest request, Poll poll) {
		HttpSession session = request.getSession();
		Object info = session.getAttribute("login");
		mv.addObject("info", info);
		
		List<Poll> pollList = service.select(poll);
		mv.addObject("pollList", pollList);
		
		mv.setViewName("poll/select");
		return mv;
	}
	
	// 투표 상세 조회
	@GetMapping("/readPoll")
	public ModelAndView readPoll(ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "poll_no", required = false) String poll_no) {
		HttpSession session = request.getSession();
		Object login = session.getAttribute("login");
		mv.addObject("login", login);
		
		Poll poll = service.readPoll(poll_no);
		mv.addObject("poll", poll);
		mv.setViewName("poll/read");
		return mv;
	}
	
	// 투표 등록
	@PostMapping("/insertPoll")
	@ResponseBody
	public HashMap<String, Object> insertPoll(Poll poll) {

		int insert = service.insertPoll(poll);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (insert == 0) {
			map.put("check", 0);
		} else {
			map.put("check", 1);
		}
		return map;
	}
	
	// 옵션 등록
	@PostMapping("/insertOption")
	@ResponseBody
	public HashMap<String, Object> insertOption(Poll poll) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//여러개 값 보낼때 근데 난 하나만 보냄
		Poll pollParam = null;
		for(int i = 0; i < poll.getOption_vals().length; i++) {
			pollParam = new Poll();
			pollParam.setOption_val(poll.getOption_vals()[i]);
			service.insertOption(pollParam);
		}
		
		return map;
	}


}
