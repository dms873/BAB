package kh.spring.bab.organ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("organ")
public class OraganizationChartController {

	@GetMapping("/select")
	public ModelAndView select(ModelAndView mv) {
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
