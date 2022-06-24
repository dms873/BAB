package kh.spring.bab.eap.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;

@Repository
public class EapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 문서양식-휴가신청서일 때
	public int insertHoDoc() {
		return sqlSession.insert("Eap.insertHoDoc");
	}
	
	// 문서양식-지출결의서일 때
	public int insertSpDoc() {
		return sqlSession.insert("Eap.insertSpDoc");
	}
	
	// 문서양식 번호 조회
	public Eap selectDoc(String df_code) {
		return sqlSession.selectOne("Eap.selectDoc", df_code);
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장
	public int insertapp(Eap eap) {
		return sqlSession.insert("Eap.insertapp", eap);
	}
	
	// 전자결재 테이블 update
	public int updateeap(Eap eap) {
		return sqlSession.update("Eap.updateeap", eap);
	}

	// 휴가테이블 insert
	public int insertatt(Attendance att) {
		return sqlSession.update("Eap.insertatt", att);
	}

}
