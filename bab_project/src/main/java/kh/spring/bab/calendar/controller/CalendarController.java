package kh.spring.bab.calendar.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.calendar.domain.Calendar;
import kh.spring.bab.calendar.model.service.CalendarServiceImpl;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	@Autowired
	private CalendarServiceImpl service;
	
	// 캘린더 조회
	@GetMapping("select")
	public ModelAndView select(ModelAndView mv, HttpServletRequest request) {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object login = session.getAttribute("login");

		mv.addObject("login", login);

		mv.setViewName("calendar/select");
		return mv;
	}
	
	// 캘린더 등록
	@PostMapping("insert")
	@ResponseBody
	public HashMap<String, Object> insert(Calendar cal, HttpServletRequest request) {
		
		int insert = service.insert(cal);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(insert==0) {
			map.put("check", 0);
		}else {
			map.put("check", 1);
		}
		return map;
	}

	// 캘린더 업데이트
	@GetMapping("update")
	public ModelAndView update(ModelAndView mv) {
		mv.setViewName("calendar/update");
		return mv;
	}

}
