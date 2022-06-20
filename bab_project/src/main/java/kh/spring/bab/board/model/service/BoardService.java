package kh.spring.bab.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.board.model.dao.BoardDao;

@Service
public interface BoardService {
	
	
	// 공지사항 조회
		/**
		 *  @param :
		 *  @return : dao.selectBoard(board)
		 *  @author : 윤영원
		 **/
	public List<Board> selectBoard(int currentPage, int pageSize);
	
	// 공지사항 목록 갯수
		/**
		 *  @param :
		 *  @return : dao.selectTotalCnt()
		 *  @author : 윤영원
		 **/
	public int selectTotalCnt();
	
	// 상세보기 조회
	public Board readBoard(String board_no);
	
	// 공지사항 등록
		/**
		 *  @param : Board
		 *  @return : dao.insertBoard(board)
		 *  @author : 윤영원
		 **/
	public int insertBoard(Board board);
	
	// 공지사항 수정
		/**
		 *  @param : Board
		 *  @return : dao.updateBoard(board)
		 *  @author : 윤영원
		 **/
	public int updateBoard(Board board);
	
	// 공지사항 삭제
			/**
			 *  @param : board_no[i]
			 *  @return : dao.deleteBoard(board)
			 *  @author : 윤영원
			 **/
	public int deleteBoard(String board_no);
}
