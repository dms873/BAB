package kh.spring.bab.attendance.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.attendance.domain.Attendance;

@Repository
public class AttendanceDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 출근 시간 저장
	public int insertStart(String emp_no) {
		return sqlSession.insert("Attendance.insertStart", emp_no);
	}
	
	// 퇴근 시간 저장
	public int updateEnd(String emp_no) {
		return sqlSession.update("Attendance.updateEnd", emp_no);
	}
	
	// 오늘 근태 현황조회
	public Attendance selectToday(String emp_no) {
		return sqlSession.selectOne("Attendance.selectToday", emp_no);
	}
	
	// 소정 근무 시간 구하기
	public int updateWorkTime(String emp_no) {
		return sqlSession.update("Attendance.updateWorkTime", emp_no);
	}
	
	// 월별 근태 현황조회
	public List<Attendance> selectMonth(String emp_no) {
		return sqlSession.selectList("Attendance.selectMonth", emp_no);
	}
	
}
