package kh.spring.bab.board.domain;


import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Board {
//	BOARD_NO      NOT NULL NUMBER         
//	BOARD_TITLE   NOT NULL VARCHAR2(150)  
//	BOARD_WRITER  NOT NULL VARCHAR2(30)   
//	BOARD_DATE    NOT NULL TIMESTAMP(6)   
//	BOARD_CONTENT NOT NULL VARCHAR2(2000) 
//	EMP_NO        NOT NULL VARCHAR2(30) 
	
	private int board_no;
	private String board_title;
	private String board_writer;
	private String board_date;
	private String board_content;
	private String emp_no;
	
	//검색필터
	private String type; // 검색타입
	private String keyword; // 검색내용
	
	
	
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_title=" + board_title + ", board_writer=" + board_writer
				+ ", board_date=" + board_date + ", board_content=" + board_content + ", emp_no=" + emp_no + ", type="
				+ type + ", keyword=" + keyword + "]";
	}

	public int getBoard_no() {
		return board_no;
	}



	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}



	public String getBoard_title() {
		return board_title;
	}



	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}



	public String getBoard_writer() {
		return board_writer;
	}



	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}



	public String getBoard_date() {
		return board_date;
	}



	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}



	public String getBoard_content() {
		return board_content;
	}



	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}



	public String getEmp_no() {
		return emp_no;
	}



	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
