package kh.spring.bab.calendar.domain;

import org.springframework.stereotype.Component;

@Component
public class CalendarHo {
	
	//desc holiday
//	HO_NO        NOT NULL NUMBER       
//	HO_CODE               VARCHAR2(1)  
//	HO_START              TIMESTAMP(6) 
//	HO_END                TIMESTAMP(6) 
//	HO_RM_COUNT           NUMBER       
//	HO_USE_COUNT          NUMBER       
//	EMP_NO       NOT NULL VARCHAR2(30) 
//	DF_NO                 VARCHAR2(30) 
	
	//desc employee
//	EMP_NAME      NOT NULL VARCHAR2(30)
	
	//변수 이름짓기
	private String ho_start;
	private String ho_end;
	private String emp_no;
	private String emp_name;
	
	//toString
	@Override
	public String toString() {
		return "CalendarHo [ho_start=" + ho_start + ", ho_end=" + ho_end + ", emp_no=" + emp_no + ", emp_name="
				+ emp_name + "]";
	}
	
	//게터세터
	public String getHo_start() {
		return ho_start;
	}

	public void setHo_start(String ho_start) {
		this.ho_start = ho_start;
	}

	public String getHo_end() {
		return ho_end;
	}

	public void setHo_end(String ho_end) {
		this.ho_end = ho_end;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	
	
	
	
}
