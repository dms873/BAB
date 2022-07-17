package kh.spring.bab.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
		// 메인페이지 공지사항 조회
		@Override
		public List<Board> selectBList() {
			return dao.selectBList();
		}
	
		// 공지사항 조회
		@Override
		public List<Board> selectBoard(int currentPage, int pageSize, Board board) {
			return dao.selectBoard(currentPage, pageSize, board);
		}
		
		// 공지사항 총 갯수
		@Override
		public int selectTotalCnt() {
			return dao.selectTotalCnt();
		}
		
		// 공지사항 상세보기
		@Override
		public Board readBoard(String board_no) {
			return dao.readBoard(board_no);
		}
		
		// 공지사항 글 쓰기
		@Override
		public int insertBoard(Board board) {
			return dao.insertBoard(board);
		}
		
		// 공지사항 수정
		@Override
		public int updateBoard(Board board) {
			return dao.updateBoard(board);
		}
		
		// 공지사항 삭제
		@Override
		public int deleteBoard(String board_no) {
			return dao.deleteBoard(board_no);
		}
		
}
