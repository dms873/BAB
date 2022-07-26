package kh.spring.bab.contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.contact.domain.Contact;
import kh.spring.bab.contact.model.service.ContactService;

@Controller
@RequestMapping("contact")
public class ContactController {
	
	@Autowired
	private ContactService service;
	
	
	@GetMapping(value="/select", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView selectContact(ModelAndView mv
			, @RequestParam(name="page", defaultValue = "1") int currentPage
			, @RequestParam(name="type", required = false) String type
			, @RequestParam(name="keyword", required = false) String keyword
			, Contact contact
			) {
		
		System.out.println("type : " + type);
		System.out.println("keyword : " + keyword);
		
		contact.setType(type);
		contact.setKeyword(keyword);
		
		final int pageSize = 10;
		final int pageBlock = 5;
		
		List<Contact> selectContact = service.selectContact(currentPage, pageSize, contact);
			
		int totalCnt = service.selectSearchTotalCnt(contact);
		System.out.println("totalCnt :" + totalCnt);
		
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
		
		mv.addObject("selectContact", selectContact);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("totalCnt", totalCnt);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("contact/select");
		
		return mv;
	}
	
	
	@GetMapping("/selectBtn")
	@ResponseBody
	public ModelMap selectBtn() {
		ModelMap mv= new ModelMap();
		mv.addAttribute("selectContact", service.selectBtn());
		return mv;
	}
	
}
