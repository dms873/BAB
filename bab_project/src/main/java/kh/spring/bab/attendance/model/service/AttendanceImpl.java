package kh.spring.bab.attendance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.attendance.model.dao.AttendanceDao;

@Service
public class AttendanceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao dao;

	// 출근 시간 저장
	@Override
	public int insertStart(String emp_no) {
		return dao.insertStart(emp_no);
	}

	// 퇴근 시간 저장
	@Override
	public int updateEnd(String emp_no) {
		return dao.updateEnd(emp_no);
	}

	// 오늘 근태 현황조회
	@Override
	public Attendance selectToday(String emp_no) {
		return dao.selectToday(emp_no);
	}

	// 소정 근무 시간 구하기
	@Override
	public int updateWorkTime(String emp_no) {
		return dao.updateWorkTime(emp_no);
	}

	// 월별 근태 현황조회
	@Override
	public List<Attendance> selectMonth(int currentPage, int pageSize, String emp_no) {
		return dao.selectMonth(currentPage, pageSize, emp_no);
	}
	
	// 누적 근무시간
	@Override
	public int workTimeCnt(String emp_no) {
		return dao.workTimeCnt(emp_no);
	}

	// 총 연차 일수
	@Override
	public int totalHoCnt(String emp_no) {
		return dao.totalHoCnt(emp_no);
	}

	// 사용 연차 일수
	@Override
	public Double useHoCnt(String emp_no) {
		return dao.useHoCnt(emp_no);
	}

	// 연차 사용 내역
	@Override
	public List<Attendance> useHoList(int currentPage, int pageSize, String emp_no) {
		return dao.useHoList(currentPage, pageSize, emp_no);
	}

	// 내 연차 내역의 로그인한 사람의 정보
	@Override
	public Attendance selectInfo(String emp_no) {
		return dao.selectInfo(emp_no);
	}

	// 연차 사용 내역 리스트 개수
	@Override
	public int totalUseHoCnt(String emp_no) {
		return dao.totalUseHoCnt(emp_no);
	}

	// 월별 근태 현황조회 리스트 개수
	@Override
	public int totalselectMonth(String emp_no) {
		return dao.totalselectMonth(emp_no);
	}

}
