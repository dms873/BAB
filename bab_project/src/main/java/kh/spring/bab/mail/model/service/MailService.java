package kh.spring.bab.mail.model.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.mail.domain.MailRcv;
import kh.spring.bab.mail.domain.MailSend;


@Service
public interface MailService {

		// 보낸 메일함 저장
			/**
			 *  @param : MailSend mailSend
			 *  @return : dao.insertSendMail(mailSend)
			 *  @author : 윤영원
			 **/
		public int insertSendMail(MailSend mailSend);
		
		// 받은 메일함 저장
			/**
			 *  @param : MailRcv mailRcv
			 *  @return : dao.insertRcvMail(mailRcv)
			 *  @author : 윤영원
			 **/
	    public int insertRcvMail(MailRcv mailRcv);
	    
		// 받은 메일함 새로운 메일 숫자 표시
		/**
		 *  @param : String email
		 *  @return : dao.newMail(email)
		 *  @author : 윤영원
		 **/
	    public int newMail(String email);
	    
		// 받은 메일함 제목 클릭 시 읽음 표시 변경 'N'->'Y'
		/**
		 *  @param : int mailNo
		 *  @return : dao.updateRead(mailNo)
		 *  @author : 윤영원
		 **/
	    public int updateRead(int mailNo);
	    
		// 받은 메일함 읽음 버튼 클릭 시 읽음 표시 변경 'N'->'Y'
		/**
		 *  @param : String rec_no
		 *  @return : dao.readOnly(rec_no)
		 *  @author : 윤영원
		 **/
	    public int readOnly(String rec_no);
	    
		// 받은 메일함 상세보기
		/**
		 *  @param : int mailNo
		 *  @return : dao.readRcvMail(mailNo)
		 *  @author : 윤영원
		 **/
	    public MailRcv readRcvMail(int mailNo);
	    
		// 보낸 메일함 상세보기
		/**
		 *  @param : int mailNo
		 *  @return : dao.readSndMail(mailNo)
		 *  @author : 윤영원
		 **/
	    public MailSend readSndMail(int mailNo);
	    
		// 보낸 메일함 삭제
		/**
		 *  @param : String send_no
		 *  @return : dao.readSndMail(send_no)
		 *  @author : 윤영원
		 **/
	    public int deleteSndMail(String send_no);
	    
		// 받은 메일함 삭제
		/**
		 *  @param : String rec_no
		 *  @return : dao.readRcvMail(rec_no)
		 *  @author : 윤영원
		 **/
	    public int deleteRcvMail(String rec_no);
	    
	    
	    // 받은 메일함 리스트
 			/**
 			 *  @param : int currentPage, int pageSize, MailRcv mailRcv
 			 *  @return : dao.selectRcvMail(currentPage, pageSize, mailRcv)
 			 *  @author : 윤영원
 			 **/
	 	public List<MailRcv> selectRcvMail(int currentPage, int pageSize, String email);
	 	
	    // 받은 메일함 리스트 갯수
 			/**
 			 *  @param : String email
 			 *  @return : dao.selectRcvMail(currentPage, pageSize, email)
 			 *  @author : 윤영원
 			 **/
	 	public int selectRcvTotalCnt(String email);
		
	    // 보낸 메일함 리스트
 			/**
 			 *  @param : int currentPage, int pageSize, String email
 			 *  @return : dao.selectSndMail(currentPage, pageSize, email)
 			 *  @author : 윤영원
 			 **/
	 	public List<MailSend> selectSndMail(int currentPage, int pageSize, String email);
		
	    // 보낸 메일함 리스트 갯수
 			/**
 			 *  @param : String email
 			 *  @return : dao.selectSndMail(mailSnd)
 			 *  @author : 윤영원
 			 **/
	 	public int selectSndTotalCnt(String email);
		
}
