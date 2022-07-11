package kh.spring.bab.mail.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.mail.domain.MailRcv;
import kh.spring.bab.mail.domain.MailSend;

@Repository
public class MailDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSendMail(MailSend mailSend) {
		return sqlSession.insert("Mail.insertSendMail", mailSend);
	}
	
	public int insertRcvMail(MailRcv mailRcv) {
		return sqlSession.insert("Mail.insertRcvMail", mailRcv);
	}
}
