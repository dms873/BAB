package kh.spring.bab.calendar.domain;

import org.springframework.stereotype.Component;

@Component
public class CalendarHBD {
	
	//desc employee
//	EMP_NAME      NOT NULL VARCHAR2(30)
//	EMP_RNUM      NOT NULL VARCHAR2(30)
	
	//변수 이름짓기
	private String emp_name;
	private String emp_rnum;
	private String hbd_start;
	private String hbd_end;
	
	//toString
	@Override
	public String toString() {
		return "CalendarHBD [emp_name=" + emp_name + ", emp_rnum=" + emp_rnum + ", hbd_start=" + hbd_start
				+ ", hbd_end=" + hbd_end + "]";
	}
	
	//게터세터
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_rnum() {
		return emp_rnum;
	}

	public void setEmp_rnum(String emp_rnum) {
		this.emp_rnum = emp_rnum;
	}

	public String getHbd_start() {
		return hbd_start;
	}

	public void setHbd_start(String hbd_start) {
		this.hbd_start = hbd_start;
	}

	public String getHbd_end() {
		return hbd_end;
	}

	public void setHbd_end(String hbd_end) {
		this.hbd_end = hbd_end;
	}
	
	
	
	

}
