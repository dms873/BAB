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
	
		// 공지사항 조회
		@Override
		public List<Board> selectBoard(){
			return dao.selectBoard();
		};
		
		@Override
		public int insertBoard(Board board) {
			return dao.insertBoard(board);
		}
		
		@Override
		public int updateBoard(Board board) {
			return dao.updateBoard(board);
		}
		
}
