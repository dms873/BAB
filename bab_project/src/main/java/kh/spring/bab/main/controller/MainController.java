package kh.spring.bab.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.attendance.model.service.AttendanceImpl;
import kh.spring.bab.board.domain.Board;
import kh.spring.bab.board.model.service.BoardService;
import kh.spring.bab.calendar.domain.Calendar;
import kh.spring.bab.calendar.domain.CalendarHBD;
import kh.spring.bab.calendar.domain.CalendarHo;
import kh.spring.bab.calendar.model.service.CalendarServiceImpl;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.model.service.EapServiceImpl;
import kh.spring.bab.employee.domain.Employee;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// 손은진 추가(220702)
	@Autowired
	private EapServiceImpl eapservice;
	// 손은진 추가(220709)
	@Autowired
	private AttendanceImpl attservice;
	// 장혜미 추가(220711)
	@Autowired
	private CalendarServiceImpl calservice;
	// 윤영원 추가(220717)
	@Autowired
	private BoardService bodservice;

	@GetMapping("/main")
	public ModelAndView select(ModelAndView mv, HttpServletRequest request) {
		// 로그인세션 가져오기 : 장혜미 추가(220629)
		HttpSession session = request.getSession();
		Object info = session.getAttribute("login");
		mv.addObject("info", info);
		
		// 로그인한 사람 정보 가져오기(사번) : 손은진 추가(220702)
		Employee emp = (Employee) request.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		// 전자 결재 대기 : 손은진 추가(220702)
		List<Eap> homeRcDoc = eapservice.selectHomeRcDoc(emp_no);
		mv.addObject("homeRcDoc", homeRcDoc);
		
		// 전자 결재 대기 개수 : 손은진 추가(220702)
		int homeRcDocCnt = eapservice.reDocCnt(emp_no);
		mv.addObject("homeRcDocCnt", homeRcDocCnt);
		
		// 누적 근무 시간 : 손은진 추가(220709)
		int workTimeCnt = attservice.workTimeCnt(emp_no);
		mv.addObject("workTimeCnt", workTimeCnt);
		
		// 캘린더 일정 조회 : 장혜미 추가(220711)
		List<Calendar> calList = calservice.select();
		mv.addObject("calList", calList);
		
		// 캘린더 휴가 조회 : 장혜미 추가(220711)
		List<CalendarHo> calHoList = calservice.selectHo();
		mv.addObject("calHoList", calHoList);
		
		// 캘린더 생일 조회 : 장혜미 추가(220711)
		List<CalendarHBD> calHBDList = calservice.selectHBD();
		mv.addObject("calHBDList", calHBDList);
		
		mv.setViewName("main/mainpage");
		
		// 공지사항 조회 : 윤영원 추가 (220717)
		List<Board> boardList = bodservice.selectBList();
		mv.addObject("boardList", boardList);
		
		mv.setViewName("main/mainpage");
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	private ModelAndView handlerMemberException(Exception e) {
		logger.error(e.getMessage());
		ModelAndView mv = new ModelAndView();
		mv.addObject("errMsg", e.getMessage());
		// 에러페이지로 이동하는걸 추천
		mv.setViewName("error/errException");
		return mv;
	}
	
	
}