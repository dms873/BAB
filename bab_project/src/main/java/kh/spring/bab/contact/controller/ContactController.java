package kh.spring.bab.contact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("contact")
public class ContactController {

	@GetMapping("/select")
	public ModelAndView select(ModelAndView mv) {
		mv.setViewName("contact/select");
		return mv;
	}
	
	
}
