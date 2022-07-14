package kh.spring.bab.mail.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.mail.domain.MailRcv;
import kh.spring.bab.mail.domain.MailSend;
import kh.spring.bab.mail.model.dao.MailDao;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao dao;
	
	@Override
	public int insertSendMail(MailSend mailSend) {
		return dao.insertSendMail(mailSend);
	}
	
	@Override
	public int insertRcvMail(MailRcv mailRcv) {
		return dao.insertRcvMail(mailRcv);
	}
	
	@Override
	public MailRcv readRcvMail(int mailNo) {
		return dao.readRcvMail(mailNo);
	}
	
	@Override
	public MailSend readSndMail(int mailNo) {
		return dao.readSndMail(mailNo);
	}
	
	@Override
	public int deleteSndMail(String send_no) {
		return dao.deleteSndMail(send_no);
	}
	
	@Override
	public int deleteRcvMail(String rec_no) {
		return dao.deleteSndMail(rec_no);
	}
	
	@Override
	public List<MailRcv> selectRcvMail(int currentPage, int pageSize, String email){
		return dao.selectRcvMail(currentPage, pageSize, email);
	}
	
	@Override
	public int selectRcvTotalCnt() {
		return dao.selectRcvTotalCnt();
	}
	
	@Override
	public List<MailSend> selectSndMail(int currentPage, int pageSize, String email){
		return dao.selectSndMail(currentPage, pageSize, email);
	}
	
	@Override
	public int selectSndTotalCnt() {
		return dao.selectSndTotalCnt();
	}
}
