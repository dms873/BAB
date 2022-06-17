package kh.spring.bab.eap.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.eap.domain.Eap;

@Repository
public class EapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertHoDoc() {
		return sqlSession.insert("Eap.insertHoDoc");
	}
	
	public int insertSpDoc() {
		return sqlSession.insert("Eap.insertSpDoc");
	}
	
	public Eap selectDoc(String df_code) {
		return sqlSession.selectOne("Eap.selectDoc", df_code);
	}

}
