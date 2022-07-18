package kh.spring.bab.eap.controller;

import java.text.DecimalFormat;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.domain.Spending;
import kh.spring.bab.eap.model.service.EapService;
import kh.spring.bab.employee.domain.Employee;

@Controller
@RequestMapping("eap")
public class ElectronicApprovalController {
	
	private static final Logger logger = LoggerFactory.getLogger(ElectronicApprovalController.class);
	
	@Autowired
	private EapService service;

	// 전자결재 홈
	@GetMapping("/main")
	public ModelAndView select(
			ModelAndView mv,
			HttpServletRequest req
			) {
		
		// 로그인한 사람 정보 가져오기(사번, 이름)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		// String emp_name = emp.getEmp_name();
		
		// 결재 대기 문서 개수
		int beDocCnt = service.beDocCnt(emp_no);
		mv.addObject("beDocCnt", beDocCnt);
		
		// 전자 결재 대기
		List<Eap> homeBeDoc = service.selectHomeBeDoc(emp_no);
		mv.addObject("homeBeDoc", homeBeDoc);
		
		// 기안 진행 문서
		List<Eap> homeRcDoc = service.selectHomeRcDoc(emp_no);
		mv.addObject("homeRcDoc", homeRcDoc);
		
		// 결재 수신 문서 개수
		int reDocCnt = service.reDocCnt(emp_no);
		mv.addObject("reDocCnt", reDocCnt);
		
		
		mv.setViewName("eap/select");
		
		return mv;
	}
	
	// 결재 대기 문서
	@GetMapping("/beforedoc")
	public ModelAndView selectBeforeDoc(
			ModelAndView mv,
			HttpServletRequest req,
			// url로 넘겨준 page를 currentPage 변수에 담아줌, 기본 값은 1
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="type", required = false) String type,
			@RequestParam(name="keyword", required = false) String keyword,
			Eap eap
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		eap.setEmp_no(emp_no);
		eap.setType(type);
		eap.setKeyword(keyword);
		
		// 한 페이지에 나타낼 개수
		final int pageSize = 3;
		// 페이징 숫자 몇 개 띄울지
		final int pageBlock = 2;
		
		List<Eap> beforeDoc = service.selectBeforeDoc(currentPage, pageSize, eap);
		
		int totalCnt = keyword == "" || keyword == null ? service.beforeTotalCnt(eap) : beforeDoc.size();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.addObject("beforeDoc", beforeDoc);
		mv.setViewName("eap/beforedoc");
		return mv;
	}
	
	// 결재 수신 문서
	@GetMapping("/receiptdoc")
	public ModelAndView selectBReceiptDoc(
			ModelAndView mv,
			HttpServletRequest req,
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="type", required = false) String type,
			@RequestParam(name="keyword", required = false) String keyword,
			Eap eap
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		eap.setEmp_no(emp_no);
		eap.setType(type);
		eap.setKeyword(keyword);
		
		final int pageSize = 3;
		final int pageBlock = 2;
		
		List<Eap> receiptDoc = service.selectReceiptDoc(currentPage, pageSize, eap);
		
		int totalCnt = keyword == "" || keyword == null ? service.receiptTotalCnt(eap) : receiptDoc.size();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.addObject("receiptDoc", receiptDoc);
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
	public ModelAndView selectSpending(ModelAndView mv) {
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
	public ModelAndView selectInsertDoc(
			ModelAndView mv,
			HttpServletRequest req,
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="type", required = false) String type,
			@RequestParam(name="keyword", required = false) String keyword,
			Eap eap
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		eap.setEmp_no(emp_no);
		eap.setType(type);
		eap.setKeyword(keyword);
		
		final int pageSize = 3;
		final int pageBlock = 2;
		
		List<Eap> result = service.selectInsertDoc(currentPage, pageSize, eap);
		
		int totalCnt = keyword == "" || keyword == null ? service.insertTotalCnt(eap) : result.size();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.addObject("insertdoc", result);
		mv.setViewName("eap/selectinsertdoc");
		return mv;
	}
	
	// 결재 문서함
	@GetMapping("/selectresultdoc")
	public ModelAndView selectResultDoc(
			ModelAndView mv,
			HttpServletRequest req,
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="type", required = false) String type,
			@RequestParam(name="keyword", required = false) String keyword,
			Eap eap
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		eap.setEmp_no(emp_no);
		eap.setType(type);
		eap.setKeyword(keyword);
		
		final int pageSize = 3;
		final int pageBlock = 2;
		
		List<Eap> result = service.selectResultDoc(currentPage, pageSize, eap);
		
		int totalCnt = keyword == "" || keyword == null ? service.referenceTotalCnt(eap) : result.size();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.addObject("resultdoc", result);
		mv.setViewName("eap/selectresultdoc");
		return mv;
	}
	
	// 참조 문서함
	@GetMapping("/selectreferencedoc")
	public ModelAndView selectReferenceDoc(
			ModelAndView mv,
			HttpServletRequest req, 
			@RequestParam(name="page", defaultValue = "1") int currentPage,
			@RequestParam(name="type", required = false) String type,
			@RequestParam(name="keyword", required = false) String keyword,
			Eap eap
			) {
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		eap.setEmp_no(emp_no);
		eap.setType(type);
		eap.setKeyword(keyword);
		
		final int pageSize = 3;
		final int pageBlock = 2;
		
		List<Eap> result = service.selectReferenceDoc(currentPage, pageSize, eap);
		
		int totalCnt = keyword == "" || keyword == null ? service.referenceTotalCnt(eap) : result.size();
		
		// paging 처리
		int pageCnt = totalCnt / pageSize + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		// int endPage = pageBlock;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.addObject("referencedoc", result);
		mv.setViewName("eap/selectreferencedoc");
		return mv;
	}

	// 문서 상세 조회
	@GetMapping("/selectdoc")
	public ModelAndView selectDoc(
			ModelAndView mv,
			HttpServletRequest req,
			@RequestParam(name = "df_no", required = false) String df_no,
			Eap eap,
			Attendance att,
			Spending sp,
			RedirectAttributes rttr
			) {
		
		if(df_no == null) {
			rttr.addFlashAttribute("msg", "번호가 없습니다. 다시 선택해주세요");
			mv.setViewName("redirect:/eap/beforedoc");
		}
		
		// 휴가신청서면
		if(df_no.substring(5,6).equals("A")) {
			Eap result = service.readHoDoc(df_no);
			mv.addObject("readHoDoc", result);
			// 첫번째 승인자 정보
			if(result.getEap_first_ap() != null) {
				Eap result2 = service.selectFirstAp(result);
				mv.addObject("firstAp", result2);
			} 
			// 두번째 승인자 정보
			if(result.getEap_mid_ap() != null) {
				Eap result3 = service.selectMidAp(result);
				mv.addObject("midAp", result3);
			} 
			// 세번째 승인자 정보
			if(result.getEap_final_ap() != null) {
				Eap result4 = service.selectFinalAp(result);
				mv.addObject("finalAp", result4);
			}
			// 휴가신청서에 저장된 정보가져오기
			att.setDf_no(result.getDf_no());
			Attendance result5 = service.selectHoInfo(att);
			mv.addObject("hoInfo", result5);
			mv.setViewName("eap/holidaydoc");
		} else { // 지출결의서면
			Eap result = service.readSpDoc(df_no);
			mv.addObject("readSpDoc", result);
			// 첫번째 승인자 정보
			if(result.getEap_first_ap() != null) {
				Eap result2 = service.selectFirstAp(result);
				mv.addObject("firstAp", result2);
			} 
			// 두번째 승인자 정보
			if(result.getEap_mid_ap() != null) {
				Eap result3 = service.selectMidAp(result);
				mv.addObject("midAp", result3);
			} 
			// 세번째 승인자 정보
			if(result.getEap_final_ap() != null) {
				Eap result4 = service.selectFinalAp(result);
				mv.addObject("finalAp", result4);
			}
			// 지출결의서에 저장된 정보가져오기
			sp.setDf_no(result.getDf_no());
			Spending result5 = service.selectSpInfo(sp);
			result5.setSp_amount(addComma(Integer.parseInt(result5.getSp_amount())));
			mv.addObject("spInfo", result5);
			mv.setViewName("eap/spendingdoc");
		}
		
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
			@RequestParam(name = "form", required = false) String form,
			HttpServletRequest req,
			Eap eap
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
			
			// 로그인한 사람 정보 가져오기
			Employee emp = (Employee) req.getSession().getAttribute("login");
			String emp_no = emp.getEmp_no();
			
			Eap eap2 = service.empInfo(emp_no);
			mv.addObject("eap", eap2);
			
			eap.setDf_code(df_code);
			eap.setEmp_no(emp_no);
			// 문서 양식 테이블에 insert 후 새로 생긴 문서번호를 가지고 전자결재 테이블 insert하기
			result = service.insertEap(eap);
			
			
			// 남은 휴가일수 확인
			Double checkHo = service.readHoCnt(emp_no);
			mv.addObject("checkHo", checkHo);
			
			// 문서양식번호 띄울 정보
			mv.addObject("resultDoc", resultDoc);
			mv.setViewName("documentForm/holiday");
		} else {
			result = service.insertSpDoc();
			df_code = "B";
			resultDoc = service.selectDoc(df_code);
			
			// 로그인한 사람 정보 가져오기
			Employee emp = (Employee) req.getSession().getAttribute("login");
			String emp_no = emp.getEmp_no();
			
			Eap eap2 = service.empInfo(emp_no);
			mv.addObject("eap", eap2);
			
			eap.setDf_code(df_code);
			eap.setEmp_no(emp_no);
			// 문서 양식 테이블에 insert 후 새로 생긴 문서번호를 가지고 전자결재 테이블 insert하기
			result = service.insertEap(eap);
			
			// 문서양식번호 띄울 정보
			mv.addObject("resultDoc", resultDoc);
			mv.setViewName("documentForm/spending");
		}
		
		if(result < 0) {
			logger.debug("실패");
		}
		
		return mv;
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(지출결의서)
	@PostMapping(value = "/updateappsp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateappsp(
			Eap eap,
			@RequestParam(name = "eap_first_ap", required = false) String eap_first_ap,
			@RequestParam(name = "eap_mid_ap", required = false) String eap_mid_ap,
			@RequestParam(name = "eap_final_ap", required = false) String eap_final_ap,
			@RequestParam(name = "eap_first_dept", required = false) String eap_first_dept,
			@RequestParam(name = "eap_final_dept", required = false) String eap_final_dept,
			@RequestParam(name = "df_no", required = false) String df_no,
			HttpServletRequest req
			) {
		
		eap.setEap_first_ap(eap_first_ap);
		eap.setEap_mid_ap(eap_mid_ap);
		eap.setEap_final_ap(eap_final_ap);
		eap.setEap_first_dept(eap_first_dept);
		eap.setEap_final_dept(eap_final_dept);
		eap.setDf_no(df_no);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		eap.setEmp_no(emp_no);
		
		int result = service.updateappsp(eap);
		
		String msg = "";
		if(result > 0) {
			msg = "결재선이 지정되었습니다.";
		} else {
			msg = "결재선 지정에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(휴가신청서)
	@PostMapping(value = "/updateappho", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateappho(
			Eap eap,
			ModelAndView mv,
			@RequestParam(name = "eap_first_ap", required = false) String eap_first_ap,
			@RequestParam(name = "eap_mid_ap", required = false) String eap_mid_ap,
			@RequestParam(name = "eap_final_ap", required = false) String eap_final_ap,
			@RequestParam(name = "eap_first_dept", required = false) String eap_first_dept,
			@RequestParam(name = "eap_final_dept", required = false) String eap_final_dept,
			@RequestParam(name = "df_no", required = false) String df_no,
			HttpServletRequest req
			) {
		
		eap.setEap_first_ap(eap_first_ap);
		eap.setEap_mid_ap(eap_mid_ap);
		eap.setEap_final_ap(eap_final_ap);
		eap.setEap_first_dept(eap_first_dept);
		eap.setEap_final_dept(eap_final_dept);
		eap.setDf_no(df_no);
		
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		eap.setEmp_no(emp_no);
		
		int result = service.updateappho(eap);
		
		// 남은 휴가일수 확인
		Double checkHo = service.readHoCnt(emp_no);
		mv.addObject("checkHo", checkHo);
		
		logger.info("결재선 리스트, 참조처 리스트 update결과 : " + result);
		
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
			@RequestParam(value = "eap_file_path", required = false) String eap_file_path,
			HttpServletRequest req
			) {
		
			eap.setDf_no(df_no);
			eap.setEap_title(eap_title);
			eap.setEap_content(eap_content);
			eap.setEap_file_path(eap_file_path);
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
			,  @RequestParam(value = "eap_file_path", required = false) String eap_file_path
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
		eap.setEap_file_path(eap_file_path);
		
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
		
		return msg;
	}
	
	// 결재 회수 Ajax
	@PostMapping(value = "/canceldoc", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String cancelDoc(
			@RequestParam(value = "df_no", required = false) String df_no
			) {
		
		// 결재 회수
		int result = service.cancelDoc(df_no);
		
		String msg = "";
		if(result > 0) {
			msg = "문서가 정상적으로 회수되었습니다.";
		} else {
			msg = "문서 회수에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 문서 수정(지출결의서) Ajax
	@PostMapping(value = "/updatesp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateSpDoc(
			@RequestParam(value = "sp_date", required = false) String sp_date
			,  @RequestParam(value = "sp_detail", required = false) String sp_detail
			,  @RequestParam(value = "sp_count", required = false) String sp_count
			,  @RequestParam(value = "sp_amount", required = false) String sp_amount
			,  @RequestParam(value = "sp_pay_code", required = false) String sp_pay_code
			,  @RequestParam(value = "df_no", required = false) String df_no
			,  @RequestParam(value = "eap_title", required = false) String eap_title
			,  @RequestParam(value = "eap_content", required = false) String eap_content
			,  @RequestParam(value = "eap_file_path", required = false) String eap_file_path
			,  @RequestParam(value = "s_img", required = false) String s_img
			,  Spending sp
			,  Eap eap
			) {
		
		sp.setSp_date(sp_date);
		sp.setSp_detail(sp_detail);
		sp.setSp_count(sp_count);
		sp_amount = removeComma(sp_amount);
		sp.setSp_amount(sp_amount);
		sp.setSp_pay_code(sp_pay_code);
		sp.setDf_no(df_no);
		eap.setDf_no(df_no);
		eap.setEap_title(eap_title);
		eap.setEap_content(eap_content);
		if(eap_file_path != null && eap_file_path != "") {
			eap.setEap_file_path(eap_file_path);
		} else {
			eap.setEap_file_path(s_img);
		}
		
		int resultSp = service.updateSpDoc(sp);
		int resultEap = service.updateEap(eap);
		
		String msg = "";
		if(resultSp > 0 && resultEap > 0) {
			msg = "문서가 정상적으로 수정되었습니다.";
		} else {
			msg = "문서 수정에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 문서 수정(휴가신청서) Ajax
	@PostMapping(value = "/updateho", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateHoDoc(
			Eap eap,
			Attendance att,
			@RequestParam(name = "df_no", required = false) String df_no,
			@RequestParam(name = "eap_title", required = false) String eap_title,
			@RequestParam(name = "eap_content", required = false) String eap_content,
			@RequestParam(name = "ho_code", required = false) String ho_code,
			@RequestParam(name = "ho_start", required = false) String ho_start,
			@RequestParam(name = "ho_end", required = false) String ho_end,
			@RequestParam(name = "ho_use_count", required = false) String ho_use_count,
			@RequestParam(value = "eap_file_path", required = false) String eap_file_path,
			@RequestParam(value = "s_img", required = false) String s_img
			) {
		
		eap.setDf_no(df_no);
		eap.setEap_title(eap_title);
		eap.setEap_content(eap_content);
		eap.setEap_file_path(eap_file_path);
		att.setDf_no(df_no);
		att.setHo_code(ho_code);
		att.setHo_start(ho_start);
		att.setHo_end(ho_end);
		att.setHo_use_count(ho_use_count);
		if(eap_file_path != null && eap_file_path != "") {
			eap.setEap_file_path(eap_file_path);
		} else {
			eap.setEap_file_path(s_img);
		}
		
		int resultHo = service.updateHpDoc(att);
		int resultEap = service.updateEap(eap);
		
		String msg = "";
		if(resultHo > 0 && resultEap > 0) {
			msg = "문서가 정상적으로 수정되었습니다.";
		} else {
			msg = "문서 수정에 실패하였습니다.";
		}
		
		return msg;
	}
	
	// 결재 승인(결재자가 1명일 때)
	@PostMapping(value = "/updateoneapp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOneApp(
				@RequestParam(value = "eap_step", required = false) String eap_step,
				@RequestParam(value = "eap_sta_code", required = false) String eap_sta_code,
				@RequestParam(value = "eap_res_code", required = false) String eap_res_code,
				@RequestParam(value = "df_no", required = false) String df_no,
				Eap eap
			) {
		
		eap.setEap_step(eap_step);
		eap.setEap_sta_code(eap_sta_code);
		eap.setEap_res_code(eap_res_code);
		eap.setDf_no(df_no);
		
		int result = service.updateOneApp(eap);
		
		
		String msg = "";
		if(result > 0) {
			msg = "승인이 완료되었습니다.";
		} else {
			msg = "승인에 실패하였습니다.";
		}
		
		return msg;
		
	}
	
	// 결재 승인(결재자가 2명 이상일 때)
	@PostMapping(value = "/updateeapapp", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateEapApp(
				@RequestParam(value = "eap_step", required = false) String eap_step,
				@RequestParam(value = "eap_sta_code", required = false) String eap_sta_code,
				@RequestParam(value = "eap_res_code", required = false) String eap_res_code,
				@RequestParam(value = "df_no", required = false) String df_no,
				Eap eap
			) {
		
		eap.setEap_step(eap_step);
		eap.setEap_sta_code(eap_sta_code);
		eap.setEap_res_code(eap_res_code);
		eap.setDf_no(df_no);
		
		int result = service.updateEapApp(eap);
		
		
		String msg = "";
		if(result > 0) {
			msg = "승인이 완료되었습니다.";
		} else {
			msg = "승인에 실패하였습니다.";
		}
		
		return msg;
		
	}
	
	// 결재 반려(결재자가 1명일 때)
	@PostMapping(value = "/updateonerej", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOneRej(
				@RequestParam(value = "eap_step", required = false) String eap_step,
				@RequestParam(value = "eap_sta_code", required = false) String eap_sta_code,
				@RequestParam(value = "eap_res_code", required = false) String eap_res_code,
				@RequestParam(value = "eap_reject", required = false) String eap_reject,
				@RequestParam(value = "df_no", required = false) String df_no,
				Eap eap
			) {
		
		eap.setEap_step(eap_step);
		eap.setEap_sta_code(eap_sta_code);
		eap.setEap_res_code(eap_res_code);
		eap.setEap_reject(eap_reject);
		eap.setDf_no(df_no);
		
		int result = service.updateOneRej(eap);
		
		
		String msg = "";
		if(result > 0) {
			msg = "반려되었습니다.";
		} else {
			msg = "실패하였습니다.";
		}
		
		return msg;
		
	}
	
	// 결재 반려(결재자가 2명 이상일 때)
	@PostMapping(value = "/updateeaprej", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateEapRej(
				@RequestParam(value = "eap_step", required = false) String eap_step,
				@RequestParam(value = "eap_reject", required = false) String eap_reject,
				@RequestParam(value = "df_no", required = false) String df_no,
				Eap eap
			) {
		
		eap.setEap_step(eap_step);
		eap.setEap_reject(eap_reject);
		eap.setDf_no(df_no);
		
		int result = service.updateEapRej(eap);
		
		
		String msg = "";
		if(result > 0) {
			msg = "반려되었습니다.";
		} else {
			msg = "실패하였습니다.";
		}
		
		return msg;
		
	}
	
	
	// 콤마제거함수
	public String removeComma(String data) {
		return data.replaceAll("\\,", "");
	}
	
	// 콤마추가함수
	public String addComma(int data) {
		DecimalFormat formatter = new DecimalFormat("###,###");
		return formatter.format(data);
	}
}
