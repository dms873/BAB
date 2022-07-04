package kh.spring.bab.calendar.model.service;

import java.util.List;

import kh.spring.bab.calendar.domain.Calendar;

public interface CalendarService {
	
	// 캘린더 조회
	/**
	 * @return cal
	 * @author 장혜미
	 */
	public List<Calendar> select();

	// 캘린더 등록
	/**
	 * @param cal
	 * @author 장혜미
	 */
	public int insert(Calendar cal);

	// 캘린더 수정
	/**
	 * @param cal
	 * @author 장혜미
	 */
	public int update(Calendar cal);
	
	// 캘린더 삭제
	/**
	 * @param cal
	 * @author 장혜미
	 */
	public int delete(Calendar cal);

}
