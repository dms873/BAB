package kh.spring.bab.poll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("poll")
public class PollController {
	
	//투표 조회
	@GetMapping("/select")
	public ModelAndView pageselect(ModelAndView mv) {
		
		mv.setViewName("poll/select");
		return mv;
	}


}
