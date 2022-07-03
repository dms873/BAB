package kh.spring.bab.chat.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kh.spring.bab.employee.domain.Employee;

@RequestMapping("echo")
public class EchoHandler extends TextWebSocketHandler {
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
		System.out.println(msg);
		String[] arr = msg.split(",");
		/* Info sInfo = (Info) map.get("login"); */
		
		/*
		 * String userId = (String) map.get("login"); System.out.println("로그인 한 아이디 : "
		 * + userId);
		 */
		
		logger.info("{} 로부터 {} 받음 ", session.getId(), message.getPayload());
		// 모든 유저에게 메세지 출력
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(arr[0]+","+arr[1]));
		}
		
	}
	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김.", session.getId());
	}
	
	@GetMapping("select")
	public ModelAndView test(
			ModelAndView mv,
			HttpServletRequest req
			) {
		// 로그인한 사람 정보 가져오기(이름)
		Employee emp = (Employee) req.getSession().getAttribute("login");
		String emp_name = emp.getEmp_name();
		mv.addObject("empName", emp_name);
		mv.setViewName("chatting/select");
		return mv;
	}
	
	
}
