package kh.spring.bab.contact.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.contact.domain.Contact;

@Repository
public class ContactDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Contact> selectContact() {
		return sqlsession.selectList("Contact.selectList");
	}
	
	public List<Contact> selectBtn() {
		return sqlsession.selectList("Contact.selectBtn");
	}
}
