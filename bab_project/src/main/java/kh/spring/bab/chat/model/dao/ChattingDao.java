package kh.spring.bab.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.chat.domain.Chatting;

@Repository
public class ChattingDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 채팅 친구 리스트
	public List<Chatting> selectEmpList(String emp_no) {
		return sqlSession.selectList("Chatting.selectEmpList", emp_no);
	}
	
	// 로그인한 사람 정보
	public Chatting selectOne(String emp_no) {
		return sqlSession.selectOne("Chatting.selectOne", emp_no);
	}
	
	// 채팅방 생성
	public int insertRoom(String room_title) {
		return sqlSession.insert("Chatting.insertRoom", room_title);
	}
	
	// 채팅방 멤버 추가
	public int insertMember(String emp_name) {
		return sqlSession.insert("Chatting.insertMember", emp_name);
	}
	
	// 채팅방 리스트
	public List<Chatting> selectRoom(String emp_no) {
		return sqlSession.selectList("Chatting.selectRoom", emp_no);
	}
	
	// 채팅방 정보
	public Chatting readRoom(String room_no) {
		return sqlSession.selectOne("Chatting.readRoom", room_no);
	}
	
	// 채팅참여자 정보
	public List<Chatting> readMember(String room_no) {
		return sqlSession.selectList("Chatting.readMember", room_no);
	}
	
	// 채팅 참여자 수
	public int memberCnt(String room_no) {
		return sqlSession.selectOne("Chatting.memberCnt", room_no);
	}
	
}
