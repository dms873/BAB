package kh.spring.bab.eap.model.service;

import kh.spring.bab.eap.domain.Eap;

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
	

}
