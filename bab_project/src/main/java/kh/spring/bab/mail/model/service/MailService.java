package kh.spring.bab.mail.model.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.bab.mail.domain.MailRcv;
import kh.spring.bab.mail.domain.MailSend;


@Service
public interface MailService {

		// 보낸 메일함 저장
			/**
			 *  @param : MailSend mailSend
			 *  @return : dao.insertSendMail(MailSend mailSend)
			 *  @author : 윤영원
			 **/
		public int insertSendMail(MailSend mailSend);
		
		// 받은 메일함 저장
			/**
			 *  @param : MailRcv mailRcv
			 *  @return : dao.insertRcvMail(MailRcv mailRcv)
			 *  @author : 윤영원
			 **/
	    public int insertRcvMail(MailRcv mailRcv);
	    
	    // 받은 메일함 리스트
 			/**
 			 *  @param : MailRcv mailRcv
 			 *  @return : dao.insertRcvMail(MailRcv mailRcv)
 			 *  @author : 윤영원
 			 **/
	 	public List<MailRcv> selectRcvMail(MailRcv mailRcv);
		
	 	
	    // 보낸 메일함 리스트
 			/**
 			 *  @param : MailRcv mailRcv
 			 *  @return : dao.insertRcvMail(MailRcv mailRcv)
 			 *  @author : 윤영원
 			 **/
	 	public List<MailSend> selectSndMail(MailSend mailSnd);
		
		
		
}
