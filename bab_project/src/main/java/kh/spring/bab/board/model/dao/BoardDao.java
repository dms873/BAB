package kh.spring.bab.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.board.domain.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Board> selectBoard() {
		return sqlSession.selectList("Board.selectBoard");
	}
}
