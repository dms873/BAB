package kh.spring.bab.mail.controller;



import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.bab.mail.domain.MailRcv;
import kh.spring.bab.mail.domain.MailSend;
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
	
	@PostMapping("/insertText")
	@ResponseBody
	public ModelAndView sendTextEmail(HttpServletRequest request,
			HttpServletResponse response,
			MailRcv mailRcv,
			MailSend mailSend,
			ModelAndView mv,
			MultipartHttpServletRequest multi
			) throws Exception{

		
		String email_id = request.getParameter("emp_id");
		String email_pwd = request.getParameter("emp_pwd");
		
		
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = email_id;
		final String password = email_pwd;
		int port= 465;
		
		
		//메일 내용
		String send_sender = username+"@naver.com";
		String send_receiver = request.getParameter("send_receiver"); // 받는 사람 이메일
		String send_title = request.getParameter("send_title"); // 제목
		String send_content = request.getParameter("send_content"); // 내용
		
		mailSend.setSend_sender(send_sender);
		mailSend.setSend_receiver(send_receiver);
		mailSend.setSend_title(send_title);
		mailSend.setSend_content(send_content);
		
		mailRcv.setRec_sender(send_sender);
		mailRcv.setRec_receiver(send_receiver);
		mailRcv.setRec_title(send_title);
		mailRcv.setRec_content(send_content);
		
		int resultSnd = service.insertSendMail(mailSend);
		int resultRcv = service.insertRcvMail(mailRcv);
		
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
		mimeMessage.setContent(send_content, "text/html; charset=UTF-8");
		Transport.send(mimeMessage);
		} catch (AddressException e) {
			System.out.println(e);
		}
		
		
		mv.setViewName("mail/main");
		return mv;
	}
	
	
	@PostMapping("/insertFile")
	@ResponseBody
	public ModelAndView sendFileEmail(HttpServletRequest request,
			HttpServletResponse response,
			ModelAndView mv,
			MultipartHttpServletRequest multi,
			MailRcv mailRcv,
			MailSend mailSend
			) throws Exception{

		String email_id = request.getParameter("emp_id");
		String email_pwd = request.getParameter("emp_pwd");
		String path = request.getParameter("path");
		
		//메일 관련 정보
		String host = "smtp.naver.com";
		final String username = email_id;
		final String password = email_pwd;
		int port= 465;
		
		//메일 내용
		String send_sender = username+"@naver.com";
		String send_receiver = request.getParameter("send_receiver"); // 받는 사람 이메일
		String send_title = request.getParameter("send_title"); // 제목
		String send_content = request.getParameter("send_content"); // 내용
		
		mailSend.setSend_sender(send_sender);
		mailSend.setSend_receiver(send_receiver);
		mailSend.setSend_title(send_title);
		mailSend.setSend_content(send_content);
		
		mailRcv.setRec_sender(send_sender);
		mailRcv.setRec_receiver(send_receiver);
		mailRcv.setRec_title(send_title);
		mailRcv.setRec_content(send_content);
		
		int resultSnd = service.insertSendMail(mailSend);
		int resultRcv = service.insertRcvMail(mailRcv);
		
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
		
		
		try {
			/*
			 * final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			 * 
			 * @Override public void prepare(MimeMessage mimeMessage) throws Exception {
			 * final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true,
			 * "UTF-8");
			 * 
			 * mailHelper.setFrom(send_sender); mailHelper.setTo(send_receiver);
			 * mailHelper.setSubject(send_title); mailHelper.setText(send_content, true);
			 * 
			 * FileSystemResource file = new FileSystemResource(new File("C:\\text.txt"));
			 * mailHelper.addAttachment("text.txt", file);
			 * 
			 * 
			 * }
			 * 
			 * };
			 */
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(send_sender));
			InternetAddress[] address = {new InternetAddress(send_receiver)};
            message.setRecipients(Message.RecipientType.TO, address);
            message.setSubject(send_title);
            
            MimeBodyPart mbp1 = new MimeBodyPart();
            mbp1.setText(send_content);
            
            MimeBodyPart mbp2 = new MimeBodyPart();
            FileDataSource  fds = new FileDataSource("C:\\test.txt"); //파일 읽어오기
            mbp2.setDataHandler(new DataHandler(fds)); //파일 첨부
            mbp2.setFileName(fds.getName());
            
            Multipart mp = new MimeMultipart();
            mp.addBodyPart(mbp1);
            mp.addBodyPart(mbp2);
            
            message.setContent(mp);
            
            Transport.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("mail/main");
		return mv;
	}

}
