package kh.spring.bab.organ.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import kh.spring.bab.employee.domain.Employee;
import kh.spring.bab.organ.domain.Organ;
import kh.spring.bab.organ.model.service.OrganServiceImpl;

@Controller
@RequestMapping("organ")
public class OraganizationChartController {
	
	private static final Logger logger = LoggerFactory.getLogger(OraganizationChartController.class);

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
		logger.info(organ);
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
		logger.info("부서 결과 : " + organ);
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
		
		logger.info("결과 : " + mv);
		
		return mv;
	}
	
	// 휴가신청서 결재선 리스트에 있는 사원 번호를 가져와 결재선jsp에 이름, 부서, 직책 띄우기(ajax)
	@PostMapping(value = "/applinelist", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView selectApplineList(
			ModelAndView mv
			, @RequestParam(value = "emp_no[]", required = false) List<String> emp_noArr
			, HttpServletRequest req
			) {
		
		logger.info("emp_no : " + emp_noArr);
		
		List<Organ> list = new ArrayList<Organ>();
		Organ result = null;
		String df_code = "";
		
		for(String emp_no : emp_noArr) {
			logger.info(emp_no);
			result = service.selectInfo(emp_no);
			list.add(result);
		}
		mv.addObject("info", list);
		logger.info("list 결과 : " + list);
		logger.info("result 결과 : " + result);
		
		df_code = "A";
		// 휴가 신청서 문서 번호 조회
		Organ docNum = service.selectDoc(df_code);
		mv.addObject("resultDoc", docNum);
		
		logger.info("docNum 결과 : " + docNum);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
				
		// 남은 휴가일수 확인
		Double checkHo = service.readHoCnt(emp_no);
		mv.addObject("checkHo", checkHo);
		
		Organ eap = service.empInfo(emp_no);
		mv.addObject("eap", eap);
		
		mv.setViewName("documentForm/holiday");
		// mv.setViewName("eap/selectLine");
		logger.info("mv 결과 : " + mv);
		
		return mv;
		
	}
	
	// 지출결의서 결재선 리스트에 있는 사원 번호를 가져와 결재선jsp에 이름, 부서, 직책 띄우기(ajax)
	@PostMapping(value = "/applinelistsp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView selectApplineListSp(
			ModelAndView mv
			, @RequestParam(value = "emp_no[]", required = false) List<String> emp_noArr
			, HttpServletRequest req
			) {
		
		logger.info("emp_no : " + emp_noArr);
		
		List<Organ> list = new ArrayList<Organ>();
		Organ result = null;
		String df_code = "";
		
		for(String emp_no : emp_noArr) {
			logger.info(emp_no);
			result = service.selectInfo(emp_no);
			list.add(result);
		}
		mv.addObject("info", list);
		logger.info("list 결과 : " + list);
		logger.info("result 결과 : " + result);
		
		df_code = "B";
		// 지출결의서 문서 번호 조회
		Organ docNum = service.selectDoc(df_code);
		mv.addObject("resultDoc", docNum);
		
		logger.info("docNum 결과 : " + docNum);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		Organ eap = service.empInfo(emp_no);
		mv.addObject("eap", eap);
		
		mv.setViewName("documentForm/spending");
		logger.info("mv 결과 : " + mv);
		
		return mv;
		
	}
	
}
