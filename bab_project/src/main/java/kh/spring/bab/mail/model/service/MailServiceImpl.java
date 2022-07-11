package kh.spring.bab.mail.model.service;

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
}
