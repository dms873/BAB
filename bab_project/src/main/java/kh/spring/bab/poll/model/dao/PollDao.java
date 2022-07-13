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
	
	// 투표 조회
	public List<Poll> select(Poll poll) {
		return sqlSession.selectList("Poll.select", poll);
	}

	// 투표 상세조회
	public Poll read(String poll_no) {
		return sqlSession.selectOne("",poll_no);
	}

	// 투표 수정
	public int update(Poll poll) {
		return sqlSession.update("",poll);
	}

	// 투표 삭제
	public int delete(String poll_no) {
		return sqlSession.delete("",poll_no);
	}

}
