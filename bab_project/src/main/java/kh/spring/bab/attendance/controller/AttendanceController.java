package kh.spring.bab.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("attendance")
public class AttendanceController {
	
	// 내 근태 현황조회
	@GetMapping("/select")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("attendance/select");
		
		return mv;
	}
	
	// 내 연차 내역
	@GetMapping("/holiday")
	public ModelAndView selectHo(ModelAndView mv) {
		mv.setViewName("attendance/selectHo");
		
		return mv;
	}

}
