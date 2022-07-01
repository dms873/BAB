package kh.spring.bab.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.calendar.domain.Calendar;
import kh.spring.bab.calendar.model.dao.CalendarDao;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao dao;
	
	//캘린더 조회
	@Override
	public Calendar select(Calendar cal) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//캘린더 등록
	@Override
	public int insert(Calendar cal) {
		return dao.insert(cal);
	}
	
	//캘린더 수정
	@Override
	public int update(Calendar cal) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//캘린더 삭제
	@Override
	public int delete(Calendar cal) {
		// TODO Auto-generated method stub
		return 0;
	}

}
