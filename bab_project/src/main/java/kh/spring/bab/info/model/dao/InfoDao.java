package kh.spring.bab.info.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao {
	
	@Autowired
	private SqlSession sqlSession;

}
