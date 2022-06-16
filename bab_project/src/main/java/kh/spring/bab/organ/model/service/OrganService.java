package kh.spring.bab.organ.model.service;

import java.util.List;

import kh.spring.bab.organ.domain.Organ;

public interface OrganService {

	// return이 있을 경우 : @return : 리턴 값에 대한 설명 작성
	// parameter가 있을 경우 : @param : 파라미터에 대한 설명 작성
	
	/**
	 * @return : 사원 이름, 부서명, 직위명 조회 
	 * @author : 손은진
	 * */
	public List<Organ> selectOrganList();
	
	/**
	 * @return : 부서코드, 부서명 조회 
	 * @author : 손은진
	 * */
	public List<Organ> selectDeptList();
	
	/**
	 * @return : 직위명 조회 
	 * @author : 손은진
	 * */
	public List<Organ> selectJobList();
	
	/**
	 * @param : 사원번호
	 * @return : 상세 직원 정보 조회
	 * @author : 손은진
	 * */
	public Organ selectDetailInfo(String emp_no);

}
