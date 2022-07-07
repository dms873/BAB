package kh.spring.bab.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kh.spring.bab.chat.domain.Chatting;
import kh.spring.bab.chat.model.service.ChattingServiceImpl;
import kh.spring.bab.employee.domain.Employee;

@RequestMapping("echo")
public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChattingServiceImpl service;
	
	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	
		sessionList.add(session);
		logger.info("{} 연결됨 ", session.getId());
	}
	
	// 클라이언트가 웹소켓 서버로 메세지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map<String, Object> map = session.getAttributes();
		String msg = message.getPayload();
		String[] arr = msg.split(",");
		
		logger.info("{} 로부터 {} 받음 ", session.getId(), message.getPayload());
		// 모든 유저에게 메세지 출력
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(arr[0]+","+arr[1] + "," + arr[2]));
		}
		
		logger.info("메세지 보낸사람 : " + arr[0]);
		logger.info("메세지 내용 : " + arr[1]);
		
		Chatting ch = new Chatting();
		ch.setEmp_name(arr[0]);
		ch.setCh_content(arr[1]);
		ch.setRoom_no(arr[2]);
		
		// 채팅 대화 DB저장
		int result = service.insertChatting(ch);
		System.out.println(result);
		
	}
	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김.", session.getId());
	}
	
	// 채팅 홈 화면
	@GetMapping("/select")
	public ModelAndView selectChatHome(
			ModelAndView mv,
			HttpServletRequest req
			) {
		// 로그인한 사람 정보 가져오기(사번)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		
		// 로그인한 사람 빼고 친구 리스트 출력
		List<Chatting> result = service.selectEmpList(emp_no);
		mv.addObject("selectEmpList", result);
		
		// 로그인한 사람 정보 출력
		Chatting result2 = service.selectOne(emp_no);
		mv.addObject("selectOne", result2);
		
		// 채팅방 리스트 출력
		List<Chatting> result3 = service.selectRoom(emp_no);
		mv.addObject("selectRoom", result3);
		
		mv.setViewName("chatting/select");
		return mv;
	}

	// 방 선택
	@GetMapping("/selectroom")
	public ModelAndView selectRoom(
			ModelAndView mv,
			HttpServletRequest req,
			@RequestParam(name = "room_no", required = false) String room_no,
			Chatting ch
			) {
		// 로그인한 사람 정보 가져오기(사번, 이름)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_no = emp.getEmp_no();
		String emp_name = emp.getEmp_name();
		
		// 채팅방 정보
		Chatting result = service.readRoom(room_no);
		mv.addObject("readRoom", result);
		
		// 채팅참여자 정보
		List<Chatting> result2 = service.readMember(room_no);
		mv.addObject("readMember", result2);
		
		// 채팅 참여자 수
		int result3 = service.memberCnt(room_no);
		mv.addObject("memberCnt", result3);
		
		// 채팅 내용 조회
		ch.setRoom_no(room_no);
		ch.setEmp_name(emp_name);
		
		List<Chatting> result4 = service.selectChatting(ch);
		mv.addObject("selectChatting", result4);
		
		mv.addObject("empName", emp_name);
		mv.addObject("roomNo", room_no);
		mv.setViewName("chatting/selectroom");
		return mv;
	}
	
	// 방 만들기 클릭 시 대화상대 선택에 있는 이름 가져와 멤버테이블에 insert하기(ajax)
	@PostMapping(value = "/insertmember", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertMember(
			ModelAndView mv,
			@RequestParam(value = "emp_name[]", required = false) List<String> emp_name_arr,
			@RequestParam(value = "room_title", required = false) String room_title
			) {
		
		// 배열 형태로 이름들 가져옴
		logger.info("emp_name_arr" + emp_name_arr);
		List<Chatting> list = new ArrayList<Chatting>();
		
		// 채팅방 생성
		int result = service.insertRoom(room_title); 
		
		// 채팅 멤버 테이블 insert(방번호, 사원번호)
		int result2 = 0;
		for(String emp_name : emp_name_arr) {
			logger.info(emp_name);
			result2 = service.insertMember(emp_name);
		}
		
		String msg = "";
		if(result > 0 && result2 > 0) {
			msg = "방이 생성되었습니다.";
		} else {
			msg = "방 생성에 실패하였습니다.";
		}
		
		return msg;
	}
	
	
}
