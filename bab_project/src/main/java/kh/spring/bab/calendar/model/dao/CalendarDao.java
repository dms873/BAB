package kh.spring.bab.calendar.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.calendar.domain.Calendar;

@Repository
public class CalendarDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//캘린더 조회
//	public Calendar select(Calendar cal) {
//		return sqlSession
//	}
	 
	//캘린더 등록
	public int insert(Calendar cal) {
		return sqlSession.insert("Calendar.insert", cal);
	}

}
