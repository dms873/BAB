package kh.spring.bab.calendar.model.service;

import kh.spring.bab.calendar.domain.Calendar;

public interface CalendarService {
	
	// 캘린더 조회
	/**
	 * @param cal
	 * @return cal
	 * @author 장혜미
	 */
	public Calendar select(Calendar cal);

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
