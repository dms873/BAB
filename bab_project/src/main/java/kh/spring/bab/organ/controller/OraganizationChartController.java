package kh.spring.bab.organ.controller;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 사원 조회 ajax
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
	
	// 부서 조회 ajax
	@PostMapping(value = "/selectdept", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectDept() {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		List<Organ> or = service.selectDeptList();
		// List<E>
		// Map
		String organ = gson.toJson(or);
		System.out.println("부서 결과 : " + organ);
		return organ;
	}
	
	@GetMapping("/selectList")
	public ModelAndView selectList(ModelAndView mv) {
		mv.setViewName("organ/selectList");
		return mv;
	}
	
	// 조직도 상세 직원 정보 조회 ajax
	@PostMapping(value = "/selectdetailinfo")
	public ModelAndView selectDetailInfo(
			ModelAndView mv
			, @RequestParam(name = "emp_no", required = false) String emp_no
			) {
		
		Organ result = service.selectDetailInfo(emp_no);
		
		mv.addObject("selectInfo", result);
		mv.setViewName("organ/selectInfo");
		
		System.out.println("결과 : " + mv);
		
		return mv;
	}
	
	// 휴가신청서 결재선 리스트에 있는 사원 번호를 가져와 결재선jsp에 이름, 부서, 직책 띄우기(ajax)
	@PostMapping(value = "/applinelist", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView selectApplineList(
			ModelAndView mv
			, @RequestParam(value = "emp_no[]", required = false) List<String> emp_noArr
			) {
		
		System.out.println("emp_no : " + emp_noArr);
		
		for(String emp_no : emp_noArr) {
			System.out.println(emp_no);
			Organ result = service.selectDetailInfo(emp_no);
			mv.addObject("info", result);
		}
		
		mv.setViewName("documentForm/holiday");
		
		return mv;
		
	}
	
}
