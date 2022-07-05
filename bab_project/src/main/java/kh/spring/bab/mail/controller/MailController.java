package kh.spring.bab.mail.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.mail.model.service.MailService;

@Controller
@RequestMapping("mail")
public class MailController {

	@Autowired
	private MailService service;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv
			) {
		mv.setViewName("mail/main");
		return mv;
	}
	
	@GetMapping("/selectRcv")
	public ModelAndView selectRcv(ModelAndView mv
			) {
		mv.setViewName("mail/selectRcv");
		return mv;
	}
	
	@GetMapping("/selectSnd")
	public ModelAndView selectSnd(ModelAndView mv
			) {
		mv.setViewName("mail/selectSnd");
		return mv;
	}
	
	
	@GetMapping("/read")
	public ModelAndView selectOne(ModelAndView mv) {
		mv.setViewName("mail/selectOne");
		return mv;
	}
	
	@GetMapping("/insert")
	public ModelAndView insertMail(ModelAndView mv) {
		mv.setViewName("mail/insert");
		return mv;
	}
	
	@PostMapping("/insert")
	public void sendEmail() throws Exception {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[] {"context-dev-email.xml"});
		JavaMailSenderImpl mailSender = (JavaMailSenderImpl)ctx.getBean("mailSender");

		// 메일 내용
		String subject = "메일 발송시 제목";
		String content = "메일 발송시 내용";

		// 보내는 사람
		String from = "보내는 사람";

		// 받는 사람
		String[] to = new String[2];
		to[0] = "받는 사람 이메일";
		to[1] = "받는 사람 이메일";

		try {
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(mail);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


}
