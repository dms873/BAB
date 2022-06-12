package kh.spring.bab.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.employee.model.service.EmployeeService;

@Controller
@RequestMapping("employee")
public class EmployeeController {

	@Autowired
	private EmployeeService service;
	
	//공통소스 테스트
	@GetMapping("/")
	public ModelAndView select(ModelAndView mv) {
		
		mv.addObject("selectEmp", service.selectEmp());
		mv.setViewName("employee/list");
		
		return mv;
	}
	// 로그인
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("employee/login");
		return mv;
	}

	// 아이디찾기
	@GetMapping("/findid")
	public ModelAndView findid(ModelAndView mv) {
		mv.setViewName("employee/findid");
		return mv;
	}
	
	// 비밀번호찾기
		@GetMapping("/findpwd")
		public ModelAndView findpwd(ModelAndView mv) {
			mv.setViewName("employee/findpwd");
			return mv;
		}

}
