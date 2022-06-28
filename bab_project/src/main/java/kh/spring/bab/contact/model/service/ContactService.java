package kh.spring.bab.contact.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.bab.contact.domain.Contact;

@Service
public interface ContactService {
	
	// 주소록 조회 리스트
			/**
			 *  @param :
			 *  @return : dao.selectTotalCnt()
			 *  @author : 윤영원
			 **/
	public List<Contact> selectContact();
	// 주소록 초성검색 리스트
			/**
			 *  @param :
			 *  @return : dao.selectTotalCnt()
			 *  @author : 윤영원
			 **/
	public List<Contact> selectBtn();
}