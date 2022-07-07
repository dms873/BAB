package kh.spring.bab.mail.model.service;


import org.springframework.stereotype.Service;

import kh.spring.bab.mail.domain.Mail;


@Service
public interface MailService {

	// 메일 보내기
			/**
			 *  @param : Mail mail
			 *  @return : dao.insertMail(Mail mail)
			 *  @author : 윤영원
			 **/
		public int insertMail(Mail mail);
}
