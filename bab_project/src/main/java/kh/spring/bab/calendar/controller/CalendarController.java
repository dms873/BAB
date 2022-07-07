package kh.spring.bab.calendar.controller;

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

import kh.spring.bab.calendar.domain.Calendar;
import kh.spring.bab.calendar.domain.CalendarHBD;
import kh.spring.bab.calendar.domain.CalendarHo;
import kh.spring.bab.calendar.model.service.CalendarServiceImpl;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	@Autowired
	private CalendarServiceImpl service;
	
	// 캘린더 조회
	@GetMapping("/select")
	public ModelAndView select(ModelAndView mv, HttpServletRequest request) {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object login = session.getAttribute("login");
		mv.addObject("login", login);
		//캘린더 일정 조회
		List<Calendar> calList = service.select();
		mv.addObject("calList", calList);
		//캘린더 휴가 조회
		List<CalendarHo> calHoList = service.selectHo();
		mv.addObject("calHoList", calHoList);
		// 캘린더 생일 조회
		List<CalendarHBD> calHBDList = service.selectHBD();
		mv.addObject("calHBDList", calHBDList);

		mv.setViewName("calendar/select");
		return mv;
	}
	
	// 캘린더 등록
	@PostMapping("/insert")
	@ResponseBody
	public HashMap<String, Object> insert(Calendar cal) {
		
		int insert = service.insert(cal);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(insert==0) {
			map.put("check", 0);
		}else {
			map.put("check", 1);
		}
		return map;
	}

	// 캘린더 일정상세 조회
	@GetMapping("/read")
	public ModelAndView read(ModelAndView mv, HttpServletRequest request
			, @RequestParam(name="cal_no", required = false) String cal_no) {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object login = session.getAttribute("login");
		mv.addObject("login", login);
		// 캘린더 일정 조회
		Calendar cal = service.read(cal_no);
		mv.addObject("cal", cal);
		mv.setViewName("calendar/update");
		return mv;
	}
	
	// 캘린더 수정
	@PostMapping("/update")
	@ResponseBody
	public HashMap<String, Object> update(Calendar cal) {

		int update = service.update(cal);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (update == 0) {
			map.put("check", 0);
		} else {
			map.put("check", 1);
		}
		return map;
	}
	
	// 캘린더 삭제
	@PostMapping("/delete")
	@ResponseBody
	public HashMap<String, Object> delete(
			@RequestParam(name="cal_no", required = false) String cal_no) {

		int delete = service.delete(cal_no);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (delete == 0) {
			map.put("check", 0);
		} else {
			map.put("check", 1);
		}
		return map;
	}

}
