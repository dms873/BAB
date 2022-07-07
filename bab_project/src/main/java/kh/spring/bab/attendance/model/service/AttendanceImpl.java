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
	public List<Attendance> selectMonth(String emp_no) {
		return dao.selectMonth(emp_no);
	}

}
