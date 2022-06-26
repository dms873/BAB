package kh.spring.bab.eap.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.domain.Spending;
import kh.spring.bab.eap.model.service.EapServiceImpl;
import kh.spring.bab.employee.domain.Employee;

@Controller
@RequestMapping("eap")
public class ElectronicApprovalController {
	
	private static final Logger logger = LoggerFactory.getLogger(ElectronicApprovalController.class);
	
	@Autowired
	private EapServiceImpl service;

	// 전자결재 홈
	@GetMapping("/main")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("eap/select");
		
		return mv;
	}
	
	// 결재 대기 문서
	@GetMapping("/beforedoc")
	public ModelAndView selectBeforeDoc(
			ModelAndView mv,
			HttpServletRequest req
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		List<Eap> beforeDoc = service.selectBeforeDoc(emp_no);
		System.out.println("결과 : " + beforeDoc);
		mv.addObject("beforeDoc", beforeDoc);
		mv.setViewName("eap/beforedoc");
		return mv;
	}
	
	// 결재 수신 문서
	@GetMapping("/receiptdoc")
	public ModelAndView selectBReceiptDoc(ModelAndView mv) {
		mv.setViewName("eap/receiptdoc");
		return mv;
	}
	
	// 휴가신청서 양식조회
	@GetMapping("/selectform/holidayForm")
	public ModelAndView selectHolidayForm(ModelAndView mv) {
		mv.setViewName("documentForm/holidayForm");
		return mv;
	}
	
	// 지출결의서 양식조회
	@GetMapping("/selectform/spendingForm")
	public ModelAndView selectSpendingForm(ModelAndView mv) {
		mv.setViewName("documentForm/spendingForm");
		return mv;
	}
	
	// 휴가신청서 입력양식
	@GetMapping("/selectform/holiday")
	public ModelAndView selectHoliday(ModelAndView mv) {
		mv.setViewName("documentForm/holiday");
		return mv;
	}
	
	// 지출결의서 입력양식
	@GetMapping("/selectform/spending")
	public ModelAndView selectSpending(ModelAndView mv
			, @RequestParam(name = "fileUrl", required = false) String fileUrl) {
		logger.info(fileUrl);
		mv.setViewName("documentForm/spending");
		return mv;
	}
	
	// 결재선
	@GetMapping("/appline")
	public ModelAndView selectEapLine(ModelAndView mv) {
		mv.setViewName("eap/selectLine");
		return mv;
	}
	
	// 기안 문서함
	@GetMapping("/selectinsertdoc")
	public ModelAndView selectInsertDoc(ModelAndView mv) {
		mv.setViewName("eap/selectinsertdoc");
		return mv;
	}
	
	// 결재 문서함
	@GetMapping("/selectresultdoc")
	public ModelAndView selectResultDoc(ModelAndView mv) {
		mv.setViewName("eap/selectresultdoc");
		return mv;
	}
	
	// 참조 문서함
	@GetMapping("/selectreferencedoc")
	public ModelAndView selectReferenceDoc(ModelAndView mv) {
		mv.setViewName("eap/selectreferencedoc");
		return mv;
	}

	// 문서 상세 조회
	@GetMapping("/selectdoc")
	public ModelAndView selectDoc(ModelAndView mv) {
		mv.setViewName("eap/selectdoc");
		return mv;
	}
	
	// 결재선 상세 조회
	@GetMapping("/selectdetailline")
	public ModelAndView selectDetailLine(ModelAndView mv) {
		mv.setViewName("eap/selectDetailLine");
		return mv;
	}
	
	// 결재양식선택 시 DB 다녀오는 ajax
	@PostMapping(value = "/insertdoc", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView insertDoc(
			ModelAndView mv,
			@RequestParam(name = "form", required = false) String form
			) {
		
		System.out.println("값 받아오나? : " + form);
		
		// 문서양식테이블 DB에 데이터 저장
		int result = 0;
		String df_code = "";
		Eap resultDoc = null;
		if(form.equals("휴가신청서")) {
			result = service.insertHoDoc();
			df_code = "A";
			resultDoc = service.selectDoc(df_code);
			logger.info("==============" + resultDoc);
			// 문서양식번호 띄울 정보
			mv.addObject("resultDoc", resultDoc);
			mv.setViewName("documentForm/holiday");
		} else {
			result = service.insertSpDoc();
			df_code = "B";
			resultDoc = service.selectDoc(df_code);
			// 문서양식번호 띄울 정보
			mv.addObject("resultDoc", resultDoc);
			mv.setViewName("documentForm/spending");
		}
		
		return mv;
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(지출결의서)
	@PostMapping(value = "/insertappsp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertappsp(
			Eap eap,
			@RequestParam(name = "eap_first_ap", required = false) String eap_first_ap,
			@RequestParam(name = "eap_mid_ap", required = false) String eap_mid_ap,
			@RequestParam(name = "eap_final_ap", required = false) String eap_final_ap,
			@RequestParam(name = "eap_first_dept", required = false) String eap_first_dept,
			@RequestParam(name = "eap_final_dept", required = false) String eap_final_dept,
			HttpServletRequest req
			) {
		
		System.out.println(eap_first_ap + ", " + eap_mid_ap + ", " + eap_final_ap + ", " + eap_first_dept + ", " + eap_final_ap);
		
		eap.setEap_first_ap(eap_first_ap);
		eap.setEap_mid_ap(eap_mid_ap);
		eap.setEap_final_ap(eap_final_ap);
		eap.setEap_first_dept(eap_first_dept);
		eap.setEap_final_dept(eap_final_dept);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		eap.setEmp_no(emp_no);
		
		int result = service.insertappsp(eap);
		
		logger.info("결재선 리스트, 참조처 리스트 insert결과 : " + result);
		
		String msg = "";
		if(result > 0) {
			msg = "결재선이 지정되었습니다.";
		} else {
			msg = "결재선 지정에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(휴가신청서)
	@PostMapping(value = "/insertapp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertapp(
			Eap eap,
			@RequestParam(name = "eap_first_ap", required = false) String eap_first_ap,
			@RequestParam(name = "eap_mid_ap", required = false) String eap_mid_ap,
			@RequestParam(name = "eap_final_ap", required = false) String eap_final_ap,
			@RequestParam(name = "eap_first_dept", required = false) String eap_first_dept,
			@RequestParam(name = "eap_final_dept", required = false) String eap_final_dept,
			HttpServletRequest req
			) {
		
		System.out.println(eap_first_ap + ", " + eap_mid_ap + ", " + eap_final_ap + ", " + eap_first_dept + ", " + eap_final_ap);
		
		eap.setEap_first_ap(eap_first_ap);
		eap.setEap_mid_ap(eap_mid_ap);
		eap.setEap_final_ap(eap_final_ap);
		eap.setEap_first_dept(eap_first_dept);
		eap.setEap_final_dept(eap_final_dept);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		eap.setEmp_no(emp_no);
		
		int result = service.insertapp(eap);
		
		logger.info("결재선 리스트, 참조처 리스트 insert결과 : " + result);
		
		String msg = "";
		if(result > 0) {
			msg = "결재선이 지정되었습니다.";
		} else {
			msg = "결재선 지정에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 결재요청 클릭 시 DB다녀올 ajax(휴가신청서)
	@PostMapping(value = "/inserteap", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String inserteap(
			Eap eap,
			Attendance att,
			@RequestParam(name = "df_no", required = false) String df_no,
			@RequestParam(name = "eap_title", required = false) String eap_title,
			@RequestParam(name = "eap_content", required = false) String eap_content,
			@RequestParam(name = "ho_code", required = false) String ho_code,
			@RequestParam(name = "ho_start", required = false) String ho_start,
			@RequestParam(name = "ho_end", required = false) String ho_end,
			@RequestParam(name = "ho_use_count", required = false) String ho_use_count,
			HttpServletRequest req
			) {
		
			logger.info("ho_code : " + ho_code);
			logger.info("eap_title : " + eap_title);
			logger.info("ho_use_count : " + ho_use_count);
		
			eap.setDf_no(df_no);
			eap.setEap_title(eap_title);
			eap.setEap_content(eap_content);
			att.setDf_no(df_no);
			att.setHo_code(ho_code);
			att.setHo_start(ho_start);
			att.setHo_end(ho_end);
			att.setHo_use_count(ho_use_count);
			
			// 로그인한 사람 정보 가져오기(사번)
			Employee emp = (Employee) req.getSession().getAttribute("login");
			String emp_no = emp.getEmp_no();
			
			att.setEmp_no(emp_no);
			eap.setEmp_no(emp_no);
			
			// 전자결재 테이블 update
			int resultEap = service.updateeap(eap);
			// 휴가테이블 insert
			int resultAtt = service.insertatt(att);
			
			String msg = "";
			if(resultEap > 0 && resultAtt > 0) {
				msg = "문서를 기안하였습니다.";
			} else {
				msg = "다시 확인하여 기안해주세요.";
			}
		
		return msg;
	}
	
	// 결재요청 클릭 시 DB다녀올 ajax(지출결의서)
	@PostMapping(value = "/insertsp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertsp(
			@RequestParam(value = "sp_date", required = false) String sp_date
			,  @RequestParam(value = "sp_detail", required = false) String sp_detail
			,  @RequestParam(value = "sp_count", required = false) String sp_count
			,  @RequestParam(value = "sp_amount", required = false) String sp_amount
			,  @RequestParam(value = "sp_pay_code", required = false) String sp_pay_code
			,  @RequestParam(value = "df_no", required = false) String df_no
			,  @RequestParam(value = "eap_title", required = false) String eap_title
			,  @RequestParam(value = "eap_content", required = false) String eap_content
			,  Spending sp
			,  Eap eap
			,  HttpServletRequest req
			) {
		
		// 콤마 제거
		sp_amount = removeComma(sp_amount);
		
		sp.setSp_date(sp_date);
		sp.setSp_detail(sp_detail);
		sp.setSp_count(sp_count);
		sp.setSp_amount(sp_amount);
		sp.setSp_pay_code(sp_pay_code);
		sp.setDf_no(df_no);
		eap.setDf_no(df_no);
		eap.setEap_title(eap_title);
		eap.setEap_content(eap_content);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		eap.setEmp_no(emp_no);
		
		// 지출테이블 insert
		int resultSp = service.insertSp(sp);
		
		// 전자결재테이블 update
		int resultEap = service.updateEapSp(eap);
		
		String msg = "";
		if(resultEap > 0 && resultSp > 0) {
			msg = "문서를 기안하였습니다.";
		} else {
			msg = "다시 확인하여 기안해주세요.";
		}
		
		
		// @RequestParam(value = "dataArr", required = false) ArrayList<Object> dataArr
		// 객체+배열로 받아서 값 받아오는거 찾아보기
		
//		String[] arrayparam = req.getParameterValues("dataArr");
//		System.out.println(arrayparam);
//		for(int i = 0; i < arrayparam.length; i++) {
//			System.out.println("배열찍어봐 : " + arrayparam[i]);
//		}
		
//		Map<String, Object> result = new HashMap<String, Object>();
//		Map<String, Object> map = new HashMap<String, Object>();
		
		
//		for(String data : arrayparam) {
//			System.out.println(data);
//		}
		return msg;
	}
	
	// 콤마제거함수
	public String removeComma(String data) {
		return data.replaceAll("\\,", "");
	}
	
	
	
	
	
}
