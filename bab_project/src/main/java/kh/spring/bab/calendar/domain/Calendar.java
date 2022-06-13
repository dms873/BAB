package kh.spring.bab.calendar.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Calendar {
	
	//desc calendar;
//	CAL_NO      NOT NULL VARCHAR2(30)  
//	CAL_TITLE   NOT NULL VARCHAR2(100) 
//	CAL_START   NOT NULL TIMESTAMP(6)  
//	CAL_END     NOT NULL TIMESTAMP(6)  
//	CAL_CONTENT          VARCHAR2(500) 
//	EMP_NO      NOT NULL VARCHAR2(30)  
	
	//변수 이름짓기
	private String cal_no;
	private String cal_title;
	private Timestamp cal_start;
	private Timestamp cal_end;
	private String cal_content;
	private String emp_no;
	
	//toString
	@Override
	public String toString() {
		return "Calendar [cal_no=" + cal_no + ", cal_title=" + cal_title + ", cal_start=" + cal_start + ", cal_end="
				+ cal_end + ", cal_content=" + cal_content + ", emp_no=" + emp_no + "]";
	}

	//게터세터
	public String getCal_no() {
		return cal_no;
	}

	public void setCal_no(String cal_no) {
		this.cal_no = cal_no;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public Timestamp getCal_start() {
		return cal_start;
	}

	public void setCal_start(Timestamp cal_start) {
		this.cal_start = cal_start;
	}

	public Timestamp getCal_end() {
		return cal_end;
	}

	public void setCal_end(Timestamp cal_end) {
		this.cal_end = cal_end;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

}
