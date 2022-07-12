package kh.spring.bab.poll.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PollDao {
	
	@Autowired
	private SqlSession sqlSession;

}
