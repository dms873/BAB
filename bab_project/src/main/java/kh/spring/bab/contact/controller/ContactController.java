package kh.spring.bab.contact.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.contact.model.service.ContactService;

@Controller
@RequestMapping("contact")
public class ContactController {
	
	@Autowired
	private ContactService service;

	@GetMapping("/select")
	public ModelAndView selectContact(ModelAndView mv) {
		mv.setViewName("contact/select");
		return mv;
	}
	
	
	@GetMapping("/selectBtn")
	@ResponseBody
	public ModelMap selectBtn() {
		ModelMap mv= new ModelMap();
		mv.addAttribute("selectBoard", service.selectBtn());
		return mv;
	}
	
}
