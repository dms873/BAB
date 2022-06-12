package kh.spring.bab.eap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("eap")
public class ElectronicApprovalController {

	@GetMapping("/main")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("eap/select");
		
		return mv;
	}
	
	@GetMapping("/beforedoc")
	public ModelAndView selectBeforeDoc(ModelAndView mv) {
		mv.setViewName("eap/beforedoc");
		return mv;
	}
	
	@GetMapping("/receiptdoc")
	public ModelAndView selectBReceiptDoc(ModelAndView mv) {
		mv.setViewName("eap/receiptdoc");
		return mv;
	}
	
	@GetMapping("/selectform/holidayForm")
	public ModelAndView selectHolidayForm(ModelAndView mv) {
		mv.setViewName("documentForm/holidayForm");
		return mv;
	}
	
	@GetMapping("/selectform/spendingForm")
	public ModelAndView selectSpendingForm(ModelAndView mv) {
		mv.setViewName("documentForm/spendingForm");
		return mv;
	}
	
	@GetMapping("/selectform/holiday")
	public ModelAndView selectHoliday(ModelAndView mv) {
		mv.setViewName("documentForm/holiday");
		return mv;
	}
	
	@GetMapping("/selectform/spending")
	public ModelAndView selectSpending(ModelAndView mv
			, @RequestParam(name = "fileUrl", required = false) String fileUrl) {
		System.out.println(fileUrl);
		mv.setViewName("documentForm/spending");
		return mv;
	}
	
	@GetMapping("/appline")
	public ModelAndView selectEapLine(ModelAndView mv) {
		mv.setViewName("eap/selectLine");
		return mv;
	}
	
}
