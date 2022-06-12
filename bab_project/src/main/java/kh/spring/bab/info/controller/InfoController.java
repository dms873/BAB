package kh.spring.bab.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("info")
public class InfoController {

	// 내정보수정 메인
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		mv.setViewName("info/main");
		return mv;
	}

	// 내정보수정 업데이트
	@GetMapping("/update")
	public ModelAndView update(ModelAndView mv) {
		mv.setViewName("info/update");
		return mv;
	}
}
