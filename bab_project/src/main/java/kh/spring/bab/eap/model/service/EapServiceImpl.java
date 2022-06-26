package kh.spring.bab.eap.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.domain.Spending;
import kh.spring.bab.eap.model.dao.EapDao;

@Service
public class EapServiceImpl implements EapService {

	@Autowired
	private EapDao dao;
	
	// 문서양식-휴가신청서일 때
	@Override
	public int insertHoDoc() {
		return dao.insertHoDoc();
	}

	// 문서양식-지출결의서일 때
	@Override
	public int insertSpDoc() {
		return dao.insertSpDoc();
	}

	// 문서양식 번호 조회
	@Override
	public Eap selectDoc(String df_code) {
		return dao.selectDoc(df_code);
	}

	// 결재선 리스트, 참조처 리스트 DB 저장(휴가신청서)
	@Override
	public int insertapp(Eap eap) {
		return dao.insertapp(eap);
	}

	// 전자결재 테이블 update(휴가신청서 작성 시)
	@Override
	public int updateeap(Eap eap) {
		return dao.updateeap(eap);
	}

	// 휴가테이블 insert
	@Override
	public int insertatt(Attendance att) {
		return dao.insertatt(att);
	}

	// 지출테이블 insert
	@Override
	public int insertSp(Spending sp) {
		return dao.insertSp(sp);
	}

	// 전자결재테이블 update(지출결의서 작성 시)
	@Override
	public int updateEapSp(Eap eap) {
		return dao.updateEapSp(eap);
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(지출결의서)
	@Override
	public int insertappsp(Eap eap) {
		return dao.insertappsp(eap);
	}

	// 결재대기문서
	@Override
	public List<Eap> selectBeforeDoc(String emp_no) {
		return dao.selectBeforeDoc(emp_no);
	}

}
