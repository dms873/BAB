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
}
