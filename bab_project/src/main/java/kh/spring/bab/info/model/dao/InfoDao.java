package kh.spring.bab.info.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.info.domain.Info;

@Repository
public class InfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 내정보수정 메인
	public Info main(Info info) {
		return sqlSession.selectOne("Info.main", info);
	}

	// 내정보수정 업데이트
	public int update(Info info) {
		return sqlSession.update("Info.update", info);
	}

}
