package kh.spring.bab.mail.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.mail.domain.Mail;

@Repository
public class MailDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSendMail(Mail mail) {
		return sqlSession.insert("Mail.insertSendMail", mail);
	}
	
	public int insertRcvMail(Mail mail) {
		return sqlSession.insert("Mail.insertRcvMail", mail);
	}
}
