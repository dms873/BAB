package kh.spring.bab.info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.info.model.service.InfoServiceImpl;

@Controller
@RequestMapping("info")
public class InfoController {
	
	@Autowired
	private InfoServiceImpl service;

	// 내정보수정 메인 페이지열기
	@GetMapping("/main")
	public ModelAndView pagemain(ModelAndView mv, HttpServletRequest request) {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object info = session.getAttribute("login");

		mv.addObject("info", info);
		mv.setViewName("info/main");
		return mv;
	}

	// 내정보수정 메인
	@PostMapping("/main")
	public ModelAndView main(ModelAndView mv) {

		mv.setViewName("info/main");
		return mv;
	}

	// 내정보수정 업데이트 페이지열기
	@GetMapping("/update")
	public ModelAndView pageupdate(ModelAndView mv) {
		mv.setViewName("info/update");
		return mv;
	}
}
