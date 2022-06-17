package kh.spring.bab.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@GetMapping("/main")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("main/mainpage");
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	private ModelAndView handlerMemberException(Exception e) {
		logger.error(e.getMessage());
		ModelAndView mv = new ModelAndView();
		mv.addObject("errMsg", e.getMessage());
		// 에러페이지로 이동하는걸 추천
		mv.setViewName("error/errException");
		return mv;
	}
	
	
}