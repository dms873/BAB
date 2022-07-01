package kh.spring.bab.organ.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.organ.domain.Organ;

@Repository
public class OrganDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 조직도에 넣을 이름, 부서명, 직위명 조회
	public List<Organ> selectOrganList() {
		return sqlSession.selectList("Organ.selectOrganList");
	}
	
	// 조직도에 넣을 부서 코드, 부서명 조회
	public List<Organ> selectDeptList() {
		return sqlSession.selectList("Organ.selectDeptList");
	}
	
	// 조직도에 넣을 직위명 조회
	public List<Organ> selectJobList() {
		return sqlSession.selectList("Organ.selectJobList");
	}
	
	// 조직도에서 상세 직원 정보 조회
	public Organ selectDetailInfo(String emp_no) {
		return sqlSession.selectOne("Organ.selectDetailInfo", emp_no);
	}
	
	// 결재선 리스트에 있는 사원 번호를 가져와 결재선jsp에 이름, 부서, 직책 조회
	public Organ selectInfo(String emp_no) {
		return sqlSession.selectOne("Organ.selectInfo", emp_no);
	}
	
	// 휴가 신청서 문서 번호 조회
	public Organ selectDoc(String df_code) {
		return sqlSession.selectOne("Organ.selectDoc", df_code);
	}
	
	// 휴가 신청서 문서 번호 조회
	public Organ empInfo(String emp_no) {
		return sqlSession.selectOne("Organ.empInfo", emp_no);
	}
	
	// 남은 휴가일수 확인
	public Double readHoCnt(String emp_no) {
		return sqlSession.selectOne("Organ.readHoCnt", emp_no);
	}
}
