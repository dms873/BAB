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
	 * @param : currentPage, pageSize, emp_no (로그인한 사람의 사번)
	 * */
	public List<Attendance> selectMonth(int currentPage, int pageSize, String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 누적 근무시간
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int workTimeCnt(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 총 연차 일수
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int totalHoCnt(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 사용 연차 일수
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public Double useHoCnt(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 연차 사용 내역
	 * @param : currentPage, pageSize, emp_no (로그인한 사람의 사번)
	 * */
	public List<Attendance> useHoList(int currentPage, int pageSize, String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 내 연차 내역의 로그인한 사람의 정보
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public Attendance selectInfo(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 연차 사용 내역 리스트 개수
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int totalUseHoCnt(String emp_no);
	
	/**
	 * @author : 손은진
	 * @return : 월별 근태 현황조회 리스트 개수
	 * @param : emp_no (로그인한 사람의 사번)
	 * */
	public int totalselectMonth(String emp_no);
}
