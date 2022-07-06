package kh.spring.bab.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.chat.domain.Chatting;
import kh.spring.bab.chat.model.dao.ChattingDao;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	private ChattingDao dao;

	// 채팅 친구 리스트
	@Override
	public List<Chatting> selectEmpList(String emp_no) {
		return dao.selectEmpList(emp_no);
	}

	// 로그인한 사람 정보
	@Override
	public Chatting selectOne(String emp_no) {
		return dao.selectOne(emp_no);
	}

	// 채팅방 생성
	@Override
	public int insertRoom(String room_title) {
		return dao.insertRoom(room_title);
	}

	// 채팅방 멤버 추가
	@Override
	public int insertMember(String emp_name) {
		return dao.insertMember(emp_name);
	}
	
	// 채팅방 리스트
	@Override
	public List<Chatting> selectRoom(String emp_no) {
		return dao.selectRoom(emp_no);
	}

	// 채팅방 정보
	@Override
	public Chatting readRoom(String room_no) {
		return dao.readRoom(room_no);
	}

	// 채팅참여자 정보
	@Override
	public List<Chatting> readMember(String room_no) {
		return dao.readMember(room_no);
	}

	// 채팅 참여자 수
	@Override
	public int memberCnt(String room_no) {
		return dao.memberCnt(room_no);
	}

}
