package kh.spring.bab.contact.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.contact.domain.Contact;

@Repository
public class ContactDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Contact> selectContact(int currentPage, int pageSize, Contact contact) {
		return sqlsession.selectList("Contact.selectContact", contact, new RowBounds((currentPage-1)*pageSize, pageSize));
	}
	
	public int selectSearchTotalCnt(Contact contact) {
		return sqlsession.selectOne("Contact.selectSearchTotalCnt", contact);
	}
	
	public List<Contact> selectBtn() {
		return sqlsession.selectList("Contact.selectBtn");
	}
}
