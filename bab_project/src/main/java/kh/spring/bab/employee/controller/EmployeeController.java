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

	// 아이디찾기 페이지열기
	@GetMapping("/findid")
	public ModelAndView pagefindid(ModelAndView mv) {
		mv.setViewName("employee/findid");
		return mv;
	}

	// 아이디찾기
	@PostMapping("/findid")
	public ModelAndView findid(ModelAndView mv, Employee employee) {
		//jsp에서 입력받은거 employee에 담아서 보내고 결과는 findid에 담기 
		Employee findid = service.findid(employee);
		//findid가 null이면 0전달
		if (findid == null) {
			mv.addObject("check", 0);
		//아니면 1전달하고 결과 받은거 findid에 넣어서 jsp로
		} else {
			mv.addObject("check", 1);
			mv.addObject("findid", findid);
		}
		mv.setViewName("employee/findid");
		return mv;
	}

	// 비밀번호찾기 페이지열기
	@GetMapping("/findpwd")
	public ModelAndView pagefindpwd(ModelAndView mv) {
		mv.setViewName("employee/findpwd");
		return mv;
	}

	// 비밀번호찾기
	@PostMapping("/findpwd")
	public ModelAndView findpwd(ModelAndView mv, Employee employee) {

		Employee findpwd = service.findpwd(employee);

		if (findpwd == null) {
			mv.addObject("check", 0);
		} else {
			mv.addObject("check", 1);
			mv.addObject("findpwd", findpwd);
		}
		mv.setViewName("employee/findpwd");
		return mv;
	}

}
