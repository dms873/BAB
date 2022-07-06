package kh.spring.bab.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.bab.chat.domain.Chatting;

@Service
public interface ChattingService {
	
	/**
	 * @author : 손은진
	 * @return : 채팅 친구 리스트
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	List<Chatting> selectEmpList(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 로그인한 사람 정보
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	Chatting selectOne(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 채팅방 생성
	 * @param : room_title (입력한 방 제목)
	 * */
	int insertRoom(String room_title);
	
	/**
	 * @author : 손은진
	 * @return : 채팅방 멤버 추가
	 * @param : emp_name (사원명)
	 * */
	int insertMember(String emp_name);
	
	/**
	 * @author : 손은진
	 * @return : 채팅방 리스트
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	List<Chatting> selectRoom(String emp_no);

	/**
	 * @author : 손은진
	 * @return : 채팅방 정보
	 * @param : room_no (방 번호)
	 * */
	Chatting readRoom(String room_no);
	
	/**
	 * @author : 손은진
	 * @return : 채팅참여자 정보
	 * @param : room_no (방 번호)
	 * */
	List<Chatting> readMember(String room_no);
	
	/**
	 * @author : 손은진
	 * @return : 채팅 참여자 수
	 * @param : room_no (방 번호)
	 * */
	int memberCnt(String room_no);
	
}
