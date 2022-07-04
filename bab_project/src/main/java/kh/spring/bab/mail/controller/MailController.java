package kh.spring.bab.mail.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/insert")
	public ModelAndView insertMail(ModelAndView mv) {
		mv.setViewName("mail/insert");
		return mv;
	}
	
//	public static void naverMailSend() {
//        String host = "smtp.naver.com"; // 네이버 계정
//        String user = "ktko@naver.com"; // 패스워드
//        String password = "password"; 
//
//        // SMTP 서버 정보를 설정한다.
//        Properties props = new Properties();
//        props.put("mail.smtp.host", host);
//        props.put("mail.smtp.port", 587);
//        props.put("mail.smtp.auth", "true");
//        
//        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(user, password);
//            }
//        });
//
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(user));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@ktko.com"));
//
//            // 메일 제목
//            message.setSubject("KTKO SMTP TEST1111");
//
//            // 메일 내용
//            message.setText("KTKO Success!!");
//
//            // send the message
//            Transport.send(message);
//            System.out.println("Success Message Send");
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//    }
}
