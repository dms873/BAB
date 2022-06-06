package kh.spring.bab.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("main")
public class MainController {

	@GetMapping("/mainpage")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("main/mainpage");
		return mv;
	}
	
	
}
