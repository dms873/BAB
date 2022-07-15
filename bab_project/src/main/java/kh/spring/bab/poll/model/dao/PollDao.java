package kh.spring.bab.poll.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.poll.domain.Poll;

@Repository
public class PollDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 투표 등록
	public int insertPoll(Poll poll) {
		return sqlSession.insert("Poll.insertPoll", poll);
	}
	
	// 옵션 등록
	public int insertOption(Poll poll) {
		return sqlSession.insert("Poll.insertOption", poll);
	}
	
	// 투표 여부확인
	public Poll voteCk(Poll poll) {
		return sqlSession.selectOne("Poll.voteCk", poll);
	}
	
	// 투표하기
	public int vote(Poll poll) {
		return sqlSession.insert("Poll.vote", poll);
	}
	
	// 투표 조회
	public List<Poll> select(Poll poll) {
		return sqlSession.selectList("Poll.select", poll);
	}

	// 투표 상세조회
	public Poll readPoll(String poll_no) {
		return sqlSession.selectOne("Poll.readPoll",poll_no);
	}
	
	// 옵션 상세조회
	public List<Poll> readOption(String poll_no) {
		return sqlSession.selectList("Poll.readOption",poll_no);
	}
	
	// 결과 상세조회
	public List<Poll> readResult(String poll_no) {
		return sqlSession.selectList("Poll.readResult", poll_no);
	}


}
