package kh.spring.bab.poll.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.poll.model.service.PollServiceImpl;


@Controller
@RequestMapping("poll")
public class PollController {
	
	@Autowired
	private PollServiceImpl service;
	
	//투표 조회 페이지열기
	@GetMapping("/select")
	public ModelAndView pageselect(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object info = session.getAttribute("login");
		
		mv.addObject("info", info);
		mv.setViewName("poll/select");
		return mv;
	}


}
