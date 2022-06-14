package kh.spring.bab.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.employee.domain.Employee;
import kh.spring.bab.employee.model.service.EmployeeServiceImpl;

@Controller
@RequestMapping("employee")
public class EmployeeController {

	@Autowired
	private EmployeeServiceImpl service;
	
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
	
	// 아이디찾기
		@PostMapping("/findid")
		public ModelAndView findid(
				ModelAndView mv
				,Employee employee
				) {
			
			Employee findid = service.findid(employee);
			
			if(findid == null) {
				mv.addObject("check", 0);
			}else {
				mv.addObject("check", 1);
				mv.addObject("findid", findid);
			}
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
