package kh.spring.bab.contact.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.contact.domain.Contact;
import kh.spring.bab.contact.model.dao.ContactDao;

@Service
public class ContactServiceImpl implements ContactService {
	
	@Autowired
	private ContactDao dao;
	
		// 주소록 조회
		@Override
		public List<Contact> selectContact(int currentPage, int pageSize, Contact contact) {
			return dao.selectContact(currentPage, pageSize, contact);
		}
		
		// 주소록 검색 목록 개수
		@Override
		public int selectSearchTotalCnt(Contact contact) {
			return dao.selectSearchTotalCnt(contact);
		}
		
		// 주소록 초성 검색
		@Override
		public List<Contact> selectBtn() {
			return dao.selectBtn();
		}
}
