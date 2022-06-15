package kh.spring.bab.organ.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.bab.organ.domain.Organ;
import kh.spring.bab.organ.model.service.OrganServiceImpl;

@Controller
@RequestMapping("organ")
public class OraganizationChartController {

	@Autowired
	private OrganServiceImpl service;
	
	
	@GetMapping("/select")
	public ModelAndView select(ModelAndView mv) {
		mv.addObject("selectOrganList", service.selectOrganList());
		mv.addObject("selectDeptList", service.selectDeptList());
		mv.addObject("selectJobList", service.selectJobList());
		mv.setViewName("organ/select");
		return mv;
	}
	
	@PostMapping(value = "/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String select() {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		List<Organ> or = service.selectOrganList();
		// List<E>
		// Map
		String organ = gson.toJson(or);
		System.out.println(organ);
		return organ;
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
