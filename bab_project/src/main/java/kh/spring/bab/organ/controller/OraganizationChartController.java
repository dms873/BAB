package kh.spring.bab.organ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.organ.model.service.OrganServiceImpl;

@Controller
@RequestMapping("organ")
public class OraganizationChartController {

	@Autowired
	private OrganServiceImpl service;
	
	
	@GetMapping("/select")
	public ModelAndView select(ModelAndView mv) {
		mv.addObject("selectOrganList", service.selectOrganList());
		mv.setViewName("organ/select");
		return mv;
	}
	
	@GetMapping("/selectList")
	public ModelAndView selectList(ModelAndView mv) {
		mv.setViewName("organ/selectList");
		return mv;
	}
	
	@GetMapping("/selectInfo")
	public ModelAndView selectInfo(ModelAndView mv) {
		mv.setViewName("organ/selectInfo");
		return mv;
	}
}
