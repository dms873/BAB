package kh.spring.bab.attendance.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.spring.bab.attendance.domain.Attendance;

@Service
public interface AttendanceService {

	/**
	 * @author : 손은진
	 * @return : 출근 시간 저장
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int insertStart(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 퇴근 시간 저장
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int updateEnd(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 오늘 근태 현황조회
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public Attendance selectToday(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 소정 근무 시간 구하기
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int updateWorkTime(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 월별 근태 현황조회
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public List<Attendance> selectMonth(String emp_no);
	
	
}
