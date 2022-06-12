package kh.spring.bab.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	// 캘린더 조회
	@GetMapping("select")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("calendar/select");
		return mv;
	}

	// 캘린더 업데이트
	@GetMapping("update")
	public ModelAndView update(ModelAndView mv) {
		mv.setViewName("calendar/update");
		return mv;
	}

}
