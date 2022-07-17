package kh.spring.bab.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.board.domain.Board;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	//메인페이지 게시글 리스트
	public List<Board> selectBList() {
		return sqlSession.selectList("Board.selectBList");
	}
	
	//게시글 리스트
	public List<Board> selectBoard(int currentPage, int pageSize, Board board) {
		return sqlSession.selectList("Board.selectBoard", board, new RowBounds((currentPage-1)*pageSize, pageSize));
	}
	
	//게시글 목록갯수
	public int selectTotalCnt() {
		return sqlSession.selectOne("Board.selectTotalCnt");
	}
	
	//게시글 상세보기
	public Board readBoard(String board_no) {
		return sqlSession.selectOne("Board.readBoard", board_no);
	}
	
	//게시글 등록
	public int insertBoard(Board board) {
		return sqlSession.insert("Board.insertBoard", board);
	}
	
	//게시글 수정
	public int updateBoard(Board board) {
		return sqlSession.update("Board.updateBoard", board);
	}
	
	//게시글 삭제
	public int deleteBoard(String board_no) {
		return sqlSession.delete("Board.deleteBoard", board_no);
	}
}
