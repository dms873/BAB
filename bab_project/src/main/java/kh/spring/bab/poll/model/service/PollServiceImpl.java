package kh.spring.bab.poll.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.poll.model.dao.PollDao;

@Service
public class PollServiceImpl {
	
	@Autowired
	private PollDao dao;

}
