package kh.spring.bab.attendance.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.attendance.model.service.AttendanceImpl;
import kh.spring.bab.employee.domain.Employee;

@Controller
@RequestMapping("attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceImpl service;
	
	// 내 근태 현황조회
	@GetMapping("/select")
	public ModelAndView select(
			ModelAndView mv,
			HttpServletRequest req
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		// 오늘 근태 현황 조회
		Attendance result = service.selectToday(emp_no);
		mv.addObject("selectToday", result);
		
		// 월별 근태 현황 조회
		List<Attendance> result2 = service.selectMonth(emp_no);
		mv.addObject("selectMonth", result2);
		
		// 현재 월
		LocalDateTime now = LocalDateTime.now();
		
		String month = now.getMonth().toString();
		System.out.println(month);
		mv.addObject("currentMonth", month);
		
		// 누적 근무시간
		int result3 = service.workTimeCnt(emp_no);
		mv.addObject("workTimeCnt", result3);
		
		mv.setViewName("attendance/select");
		
		return mv;
	}
	
	// 내 연차 내역
	@GetMapping("/holiday")
	public ModelAndView selectHo(ModelAndView mv) {
		mv.setViewName("attendance/selectHo");
		
		return mv;
	}
	
	// 출근 시간 저장
	@PostMapping(value = "/insertstart", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertStart(
			ModelAndView mv,
			HttpServletRequest req
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();

		int result = service.insertStart(emp_no);
		
		String msg = "";
		if(result > 0) {
			msg = "출근 시간이 등록되었습니다.";
		} else {
			msg = "출근 시간 등록에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 퇴근 시간 저장
	@PostMapping(value = "/updateend", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateEnd(
			ModelAndView mv,
			HttpServletRequest req
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		// 퇴근 시간 저장
		int result = service.updateEnd(emp_no);
		
		// 소정근무시간 구하기
		int result2 = service.updateWorkTime(emp_no);
		
		String msg = "";
		if(result > 0) {
			msg = "정상적으로 퇴근처리 되었습니다.";
		} else {
			msg = "퇴근처리에 실패하였습니다.";
		}
		
		return msg;
	}
	

}
