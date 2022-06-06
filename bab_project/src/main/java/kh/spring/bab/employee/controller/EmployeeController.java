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
	
	@GetMapping("/")
	public ModelAndView select(ModelAndView mv) {
		
		mv.addObject("selectEmp", service.selectEmp());
		mv.setViewName("employee/list");
		
		return mv;
	}
	
}
