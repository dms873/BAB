package kh.spring.bab.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.bab.board.domain.Board;
import kh.spring.bab.board.model.dao.BoardDao;

public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;
	
	// 공지사항 조회
		public List<Board> selectBoard(){
			return dao.selectBoard();
		};
}
