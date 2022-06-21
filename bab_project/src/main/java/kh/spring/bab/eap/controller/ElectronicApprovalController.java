package kh.spring.bab.eap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.model.service.EapServiceImpl;

@Controller
@RequestMapping("eap")
public class ElectronicApprovalController {
	
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
	public ModelAndView selectBeforeDoc(ModelAndView mv) {
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
		System.out.println(fileUrl);
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
			System.out.println("==============" + resultDoc);
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
	
	// 결재선 리스트, 참조처 리스트 DB 저장
	@PostMapping(value = "/insertapp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertapp(
			Eap eap,
			@RequestParam(name = "eap_first_ap", required = false) String eap_first_ap,
			@RequestParam(name = "eap_mid_ap", required = false) String eap_mid_ap,
			@RequestParam(name = "eap_final_ap", required = false) String eap_final_ap,
			@RequestParam(name = "eap_first_dept", required = false) String eap_first_dept,
			@RequestParam(name = "eap_final_dept", required = false) String eap_final_dept
			) {
		
		System.out.println(eap_first_ap + ", " + eap_mid_ap + ", " + eap_final_ap + ", " + eap_first_dept + ", " + eap_final_ap);
		
		eap.setEap_first_ap(eap_first_ap);
		eap.setEap_mid_ap(eap_mid_ap);
		eap.setEap_final_ap(eap_final_ap);
		eap.setEap_first_dept(eap_first_dept);
		eap.setEap_final_dept(eap_final_dept);
		
		int result = service.insertapp(eap);
		
		System.out.println("결재선 리스트, 참조처 리스트 insert결과 : " + result);
		
		return "";
	}
	
	
	
}
