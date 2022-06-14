package kh.spring.bab.organ.model.service;

import java.util.List;

import kh.spring.bab.organ.domain.Organ;

public interface OrganService {

	// return이 있을 경우 : @return : 리턴 값에 대한 설명 작성
	// parameter가 있을 경우 : @param : 파라미터에 대한 설명 작성
	
	/**
	 * @return : 사원 리스트 조회 
	 * */
	public List<Organ> selectOrganList();

}
