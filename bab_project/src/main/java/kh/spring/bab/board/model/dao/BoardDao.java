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
	
	//게시글 리스트
	public List<Board> selectBoard() {
		return sqlSession.selectList("Board.selectBoard");
	}
	
	//게시글 등록
	public int insertBoard(Board board) {
		return sqlSession.insert("Board.insertBoard", board);
	}
	
	//게시글 삭제
	public int updateBoard(Board board) {
		return sqlSession.update("Board.updateBoard", board);
	}
}
