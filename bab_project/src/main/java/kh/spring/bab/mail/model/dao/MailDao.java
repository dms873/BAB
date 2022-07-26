package kh.spring.bab.mail.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	
	public int newMail(String myemail) {
		return sqlSession.selectOne("Mail.newMail",myemail);
	}
	
	public int updateRead(int mailNo) {
		return sqlSession.update("Mail.updateRead", mailNo);
	}
	
	public MailRcv readRcvMail(int mailNo) {
		return sqlSession.selectOne("Mail.readRcvMail", mailNo);
	}
	
	public MailSend readSndMail(int mailNo) {
		return sqlSession.selectOne("Mail.readSndMail", mailNo);
	}
	
	public int readOnly(String rec_no) {
		return sqlSession.update("Mail.readOnly", rec_no);
	}
	
	public int deleteSndMail(String send_no) {
		return sqlSession.delete("Mail.deleteSndMail", send_no);
	}
	
	public int deleteRcvMail(String rec_no) {
		return sqlSession.delete("Mail.deleteRcvMail", rec_no);
	}
	
	
	public List<MailRcv> selectRcvMail(int currentPage, int pageSize, String email){
		return sqlSession.selectList("Mail.selectRcvMail", email, new RowBounds((currentPage-1)*pageSize, pageSize));
	}
	
	public int selectRcvTotalCnt(String email) {
		return sqlSession.selectOne("Mail.selectRcvTotalCnt", email);
	}
	
	public List<MailSend> selectSndMail(int currentPage, int pageSize, String email){
		return sqlSession.selectList("Mail.selectSndMail", email, new RowBounds((currentPage-1)*pageSize, pageSize));
	}
	
	public int selectSndTotalCnt(String email) {
		return sqlSession.selectOne("Mail.selectSndTotalCnt", email);
	}
}
