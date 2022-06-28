package kh.spring.bab.eap.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.domain.Spending;

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
	
	// 결재선 리스트, 참조처 리스트 DB 저장(휴가신청서)
	public int insertapp(Eap eap) {
		return sqlSession.insert("Eap.insertapp", eap);
	}
	
	// 전자결재 테이블 update(휴가신청서 작성 시)
	public int updateeap(Eap eap) {
		return sqlSession.update("Eap.updateeap", eap);
	}

	// 휴가테이블 insert
	public int insertatt(Attendance att) {
		return sqlSession.update("Eap.insertatt", att);
	}
	
	// 지출테이블 insert
	public int insertSp(Spending sp) {
		return sqlSession.insert("Eap.insertSp", sp);
	}

	// 전자결재테이블 update(지출결의서 작성 시)
	public int updateEapSp(Eap eap) {
		return sqlSession.update("Eap.updateEapSp", eap);
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(지출결의서)
	public int insertappsp(Eap eap) {
		return sqlSession.insert("Eap.insertappsp", eap);
	}

	// 결재대기문서
	public List<Eap> selectBeforeDoc(String emp_no) {
		return sqlSession.selectList("Eap.selectBeforeDoc", emp_no);
	}
	
	// 양식 처음 로드 시 띄울 정보
	public Eap empInfo(String emp_no) {
		return sqlSession.selectOne("Eap.empInfo", emp_no);
	}
	
	// 문서 상세 조회(휴가신청서)
	public Eap readHoDoc(String df_no) {
		return sqlSession.selectOne("Eap.readHoDoc", df_no);
	}
	
	// 첫번째 승인자 정보
	public Eap selectFirstAp(Eap result) {
		return sqlSession.selectOne("Eap.selectFirstAp", result);
	}
	
	// 첫번째 승인자 정보
	public Eap selectMidAp(Eap result) {
		return sqlSession.selectOne("Eap.selectMidAp", result);
	}
		
	// 첫번째 승인자 정보
	public Eap selectFinalAp(Eap result) {
		return sqlSession.selectOne("Eap.selectFinalAp", result);
	}
	
	// 휴가신청서에 저장된 정보 가져오기
	public Attendance selectHoInfo(Attendance att) {
		return sqlSession.selectOne("Eap.selectHoInfo", att);
	}
}
