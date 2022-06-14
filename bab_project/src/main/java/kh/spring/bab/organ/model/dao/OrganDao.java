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
	
	// 조직도 사원 조회
	public List<Organ> selectOrganList() {
		return sqlSession.selectList("Organ.selectOrganList");
	}
	
}
