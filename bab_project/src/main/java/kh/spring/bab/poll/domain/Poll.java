package kh.spring.bab.poll.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Poll {
	
	//desc poll
//	POLL_NO      NOT NULL VARCHAR2(30)   
//	POLL_TITLE            VARCHAR2(1000) 
//	POLL_START            VARCHAR2(30)   
//	POLL_END              VARCHAR2(30)   
//	POLL_CONTENT          VARCHAR2(2000) 
//	POLL_DATE             TIMESTAMP(6)   
//	EMP_NO       NOT NULL VARCHAR2(30) 
	
	//desc option
//	OPTION_NO  NOT NULL VARCHAR2(30)   
//	OPTION_VAL          VARCHAR2(1000) 
//	POLL_NO    NOT NULL VARCHAR2(30)
	
	//변수 이름짓기
	private String poll_no;
	private String poll_title;
	private String poll_start;
	private String poll_end;
	private String poll_content;
	private Timestamp poll_date;
	private String emp_no;
	private String option_no;
	private String option_val;
	
	//toString
	@Override
	public String toString() {
		return "Poll [poll_no=" + poll_no + ", poll_title=" + poll_title + ", poll_start=" + poll_start + ", poll_end="
				+ poll_end + ", poll_content=" + poll_content + ", poll_date=" + poll_date + ", emp_no=" + emp_no
				+ ", option_no=" + option_no + ", option_val=" + option_val + "]";
	}
	
	//게터세터
	public String getPoll_no() {
		return poll_no;
	}

	public void setPoll_no(String poll_no) {
		this.poll_no = poll_no;
	}

	public String getPoll_title() {
		return poll_title;
	}

	public void setPoll_title(String poll_title) {
		this.poll_title = poll_title;
	}

	public String getPoll_start() {
		return poll_start;
	}

	public void setPoll_start(String poll_start) {
		this.poll_start = poll_start;
	}

	public String getPoll_end() {
		return poll_end;
	}

	public void setPoll_end(String poll_end) {
		this.poll_end = poll_end;
	}

	public String getPoll_content() {
		return poll_content;
	}

	public void setPoll_content(String poll_content) {
		this.poll_content = poll_content;
	}

	public Timestamp getPoll_date() {
		return poll_date;
	}

	public void setPoll_date(Timestamp poll_date) {
		this.poll_date = poll_date;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getOption_no() {
		return option_no;
	}

	public void setOption_no(String option_no) {
		this.option_no = option_no;
	}

	public String getOption_val() {
		return option_val;
	}

	public void setOption_val(String option_val) {
		this.option_val = option_val;
	}
	
	

}
