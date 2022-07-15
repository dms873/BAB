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
	public List<Poll> readOption(String poll_no) {
		return dao.readOption(poll_no);
	}

	// 결과 상세조회
	@Override
	public List<Poll> readResult(String poll_no) {
		return dao.readResult(poll_no);
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
	
	// 투표 여부확인
	@Override
	public Poll voteCk(Poll poll) {
		return dao.voteCk(poll);
	}

	// 투표 하기
	@Override
	public int vote(Poll poll) {
		return dao.vote(poll);
	}


}
