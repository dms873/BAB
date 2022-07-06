package kh.spring.bab.chat.domain;

import org.springframework.stereotype.Component;

@Component
public class Chatting {

	private String room_no; // 방번호
	private String room_title; // 방제목
	private String room_date; // 방생성일시
	private String ch_no; // 채팅번호
	private String ch_content; // 채팅내용
	private String ch_date; // 채팅작성일시
	private String ch_emp_no; // 보낸사람사번
	private String emp_no; // 사원번호
	private String dept_name; // 부서명
	private String emp_name; // 사원명
	private String emp_file_path; // 프로필사진
	
	@Override
	public String toString() {
		return "Chatting [room_no=" + room_no + ", room_title=" + room_title + ", room_date=" + room_date + ", ch_no="
				+ ch_no + ", ch_content=" + ch_content + ", ch_date=" + ch_date + ", ch_emp_no=" + ch_emp_no
				+ ", emp_no=" + emp_no + ", dept_name=" + dept_name + ", emp_name=" + emp_name + ", emp_file_path="
				+ emp_file_path + "]";
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getRoom_date() {
		return room_date;
	}
	public void setRoom_date(String room_date) {
		this.room_date = room_date;
	}
	public String getCh_no() {
		return ch_no;
	}
	public void setCh_no(String ch_no) {
		this.ch_no = ch_no;
	}
	public String getCh_content() {
		return ch_content;
	}
	public void setCh_content(String ch_content) {
		this.ch_content = ch_content;
	}
	public String getCh_date() {
		return ch_date;
	}
	public void setCh_date(String ch_date) {
		this.ch_date = ch_date;
	}
	public String getCh_emp_no() {
		return ch_emp_no;
	}
	public void setCh_emp_no(String ch_emp_no) {
		this.ch_emp_no = ch_emp_no;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_file_path() {
		return emp_file_path;
	}
	public void setEmp_file_path(String emp_file_path) {
		this.emp_file_path = emp_file_path;
	}
	
}
