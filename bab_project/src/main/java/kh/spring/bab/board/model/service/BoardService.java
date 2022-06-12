package kh.spring.bab.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.board.model.dao.BoardDao;
import kh.spring.bab.board.model.vo.Board;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao dao;
	
	// 공지사항 조회
	public List<Board> selectBoard() {
		return dao.selectBoard();
	}
}
