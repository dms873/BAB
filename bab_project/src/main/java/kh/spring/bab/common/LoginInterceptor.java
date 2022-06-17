package kh.spring.bab.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor  {

	//preHandle() : 실제 controller(handler)가 실행되기 전에 실행되며 boolean 타입의 값을 return 한다. 
	//				true이면 요청한 handler를 처리하고 false이면 처리하지 않는다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//session 객체를 가져옴
		HttpSession session = request.getSession();
		//login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("login");
		
		//로그인이 되어있지 않음 상태
		if(obj==null) {
			response.sendRedirect("/bab/employee/login");
			//더이상 컨트롤러 요청으로 가지 않도록 false로 반환
			return false;
		}
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
	}

}
