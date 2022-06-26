package kh.spring.bab.eap.model.service;

import java.util.List;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.domain.Spending;

public interface EapService {
	
	/**
	 * @author : 손은진
	 * @return : 문서양식-휴가신청서일 때 insert 결과
	 * */
	public int insertHoDoc();
	
	/**
	 * @author : 손은진
	 * @return : 문서양식-지출결의서일 때 insert 결과
	 * */
	public int insertSpDoc();
	
	/**
	 * @author : 손은진
	 * @return : 문서양식 번호 조회
	 * @param : 문서양식코드
	 * */
	public Eap selectDoc(String df_code);
	
	/**
	 * @author : 손은진
	 * @return : 결재선 리스트, 참조처 리스트 DB 저장 insert 결과(휴가신청서)
	 * @param : Eap vo
	 * */
	public int insertapp(Eap eap);
	
	/**
	 * @author : 손은진
	 * @return : 전자결재 테이블 update(휴가신청서 작성 시)
	 * @param : Eap vo
	 * */
	public int updateeap(Eap eap);
	
	/**
	 * @author : 손은진
	 * @return : 휴가테이블 insert
	 * @param : Attendance vo
	 * */
	public int insertatt(Attendance att);
	
	/**
	 * @author : 손은진
	 * @return : 지출테이블 insert
	 * @param : Spending vo
	 * */
	public int insertSp(Spending sp);
	
	/**
	 * @author : 손은진
	 * @return : 전자결재테이블 update(지출결의서 작성 시)
	 * @param : Eap vo
	 * */
	public int updateEapSp(Eap eap);
	
	/**
	 * @author : 손은진
	 * @return : 결재선 리스트, 참조처 리스트 DB 저장 insert 결과(지출결의서)
	 * @param : Eap vo
	 * */
	public int insertappsp(Eap eap);
	
	/**
	 * @author : 손은진
	 * @return : 결재 대기 문서
	 * @param : emp_no(로그인한 사람의 사번)
	 * */
	public List<Eap> selectBeforeDoc(String emp_no);

}
