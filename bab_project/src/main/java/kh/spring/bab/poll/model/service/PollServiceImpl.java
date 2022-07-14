package kh.spring.bab.poll.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.poll.domain.Poll;
import kh.spring.bab.poll.model.dao.PollDao;

@Service
public class PollServiceImpl implements PollService {
	
	@Autowired
	private PollDao dao;
	
	// 투표 조회
	@Override
	public List<Poll> select(Poll poll) {
		return dao.select(poll);
	}
	
	// 투표 상세조회
	@Override
	public Poll readPoll(String poll_no) {
		return dao.readPoll(poll_no);
	}
	
	// 옵션 상세조회
	@Override
	public Poll readOption(String poll_no) {
		// TODO Auto-generated method stub
		return null;
	}

	// 투표 수정
	@Override
	public int update(Poll poll) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 투표 삭제
	@Override
	public int delete(String poll_no) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 투표 등록
	@Override
	public int insertPoll(Poll poll) {
		return dao.insertPoll(poll);
	}
	
	// 옵션 등록
	@Override
	public int insertOption(Poll poll) {
		return dao.insertOption(poll);
	}


}
