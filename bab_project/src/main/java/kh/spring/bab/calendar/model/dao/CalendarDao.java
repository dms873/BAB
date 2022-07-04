package kh.spring.bab.calendar.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.calendar.domain.Calendar;

@Repository
public class CalendarDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//캘린더 조회
	public List<Calendar> select() {
		return sqlSession.selectList("Calendar.select");
	}
	 
	//캘린더 등록
	public int insert(Calendar cal) {
		return sqlSession.insert("Calendar.insert", cal);
	}

}
