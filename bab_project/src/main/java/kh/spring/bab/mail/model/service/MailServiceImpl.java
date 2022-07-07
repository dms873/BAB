package kh.spring.bab.mail.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.mail.domain.Mail;
import kh.spring.bab.mail.model.dao.MailDao;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao dao;
	
	@Override
	public int insertMail(Mail mail) {
		return dao.insertMail(mail);
	}
}
