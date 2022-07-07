package kh.spring.bab.calendar.model.service;

import java.util.List;

import kh.spring.bab.calendar.domain.Calendar;
import kh.spring.bab.calendar.domain.CalendarHBD;
import kh.spring.bab.calendar.domain.CalendarHo;

public interface CalendarService {
	
	// 캘린더 조회
	/**
	 * @return cal
	 * @author 장혜미
	 */
	public List<Calendar> select();
	
	// 캘린더 조회(휴가)
	/**
	 * @return calHo
	 * @author 장혜미
	 */
	public List<CalendarHo> selectHo();
	
	// 캘린더 조회(생일)
	/**
	 * @return calHBD
	 * @author 장혜미
	 */
	public List<CalendarHBD> selectHBD();

	// 캘린더 등록
	/**
	 * @param cal
	 * @author 장혜미
	 */
	public int insert(Calendar cal);

	//캘린더 일정상세 조회
	/**
	 * @param cal_no
	 * @author 장혜미
	 */
	public Calendar read(String cal_no);
	
	// 캘린더 수정
	/**
	 * @param cal
	 * @author 장혜미
	 */
	public int update(Calendar cal);
	
	// 캘린더 삭제
	/**
	 * @author 장혜미
	 */
	public int delete(String cal_no);

}
