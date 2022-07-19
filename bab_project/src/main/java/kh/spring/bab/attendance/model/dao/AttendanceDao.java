package kh.spring.bab.attendance.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	
	// 소정 근무 시간 구하기(휴게시간 1시간 제외)
	public int updateBreakTime(String emp_no) {
		return sqlSession.update("Attendance.updateBreakTime", emp_no);
	}
	
	// 월별 근태 현황조회
	public List<Attendance> selectMonth(int currentPage, int pageSize, String emp_no) {
		return sqlSession.selectList("Attendance.selectMonth", emp_no, new RowBounds((currentPage-1)*pageSize, pageSize));
	}
	
	// 누적 근무시간
	public int workTimeCnt(String emp_no) {
		return sqlSession.selectOne("Attendance.workTimeCnt", emp_no);
	}
	
	// 총 연차 일수
	public int totalHoCnt(String emp_no) {
		return sqlSession.selectOne("Attendance.totalHoCnt", emp_no);
	}
	
	// 사용 연차 일수
	public Double useHoCnt(String emp_no) {
		return sqlSession.selectOne("Attendance.useHoCnt", emp_no);
	}
	
	// 연차 사용 내역
	public List<Attendance> useHoList(int currentPage, int pageSize, String emp_no) {
		return sqlSession.selectList("Attendance.useHoList", emp_no, new RowBounds((currentPage-1)*pageSize, pageSize));
	}
	
	// 내 연차 내역의 로그인한 사람의 정보
	public Attendance selectInfo(String emp_no) {
		return sqlSession.selectOne("Attendance.selectInfo", emp_no);
	}
	
	// 연차 사용 내역 리스트 개수
	public int totalUseHoCnt(String emp_no) {
		return sqlSession.selectOne("Attendance.totalUseHoCnt", emp_no);
	}
	
	// 월별 근태 현황조회 리스트 개수
	public int totalselectMonth(String emp_no) {
		return sqlSession.selectOne("Attendance.totalselectMonth", emp_no);
	}
	
}
