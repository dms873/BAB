package kh.spring.bab.mail.model.service;


import org.springframework.stereotype.Service;

import kh.spring.bab.mail.domain.Mail;


@Service
public interface MailService {

		// 보낸 메일함 저장
			/**
			 *  @param : Mail mail
			 *  @return : dao.insertSendMail(Mail mail)
			 *  @author : 윤영원
			 **/
		public int insertSendMail(Mail mail);
		
		// 받은 메일함 저장
			/**
			 *  @param : Mail mail
			 *  @return : dao.insertRcvMail(Mail mail)
			 *  @author : 윤영원
			 **/
	    public int insertRcvMail(Mail mail);
		
		
		
}
