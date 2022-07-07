package kh.spring.bab.mail.controller;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.mail.domain.Mail;
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
	@ResponseBody
	public ModelAndView sendEmail(HttpServletRequest request, HttpServletResponse response, Mail mail, ModelAndView mv) throws Exception{
		
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = "dvs0722";
		final String password = "babproject";
		int port= 465;
		
		
		//메일 내용
		String send_sender = username+"@naver.com";
		String send_receiver = request.getParameter("send_receiver"); // 받는 사람 이메일
		String send_title = request.getParameter("send_title"); // 제목
		String send_content = request.getParameter("send_content"); // 내용
		
		mail.setSend_sender(send_sender);
		mail.setSend_receiver(send_receiver);
		mail.setSend_title(send_title);
		mail.setSend_content(send_content);
		
		int result = service.insertMail(mail);
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); //for debug
		
		Message mimeMessage = new MimeMessage(session);
		try
		{
		mimeMessage.setFrom(new InternetAddress(send_sender)); // 주소기입
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(send_receiver));
		mimeMessage.setSubject(send_title);
		mimeMessage.setText(send_content);
		Transport.send(mimeMessage);
		} catch (AddressException e) {
			System.out.println(e);
		}
		
		mv.setViewName("mail/main");
		return mv;
	}
}
