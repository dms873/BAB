package kh.spring.bab.contact.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.contact.domain.Contact;

@Service
public interface ContactService {
	
	// 주소록 조회 리스트
			/**
			 *  @param : currentPage, pageSize, contact
			 *  @return : dao.selectContact()
			 *  @author : 윤영원
			 **/
	public List<Contact> selectContact(int currentPage, int pageSize, Contact contact);
	
		// 주소록 검색 목록 개수
		/**
		 *  @param : contact
		 *  @return : dao.selectSearchTotalCnt(Contact contact)
		 *  @author : 윤영원
		 **/
	public int selectSearchTotalCnt(Contact contact);	
	
	
	// 주소록 초성검색 리스트
			/**
			 *  @param :
			 *  @return : dao.selectBtn()
			 *  @author : 윤영원
			 **/
	public List<Contact> selectBtn();
}
