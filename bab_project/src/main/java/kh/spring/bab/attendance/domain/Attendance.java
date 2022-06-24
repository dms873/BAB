package kh.spring.bab.attendance.domain;

import org.springframework.stereotype.Component;

@Component
public class Attendance {
	
	private String ho_no; // 휴가번호
	private String ho_code; // 휴가구분코드
	private String ho_start; // 휴가시작일시
	private String ho_end; // 휴가종료일시
	private String ho_rm_count; // 휴가잔여일수
	private String ho_use_count; // 휴가사용일수
	private String emp_no; // 사번
	private String df_no; // 문서번호
	
	@Override
	public String toString() {
		return "Attendance [ho_no=" + ho_no + ", ho_code=" + ho_code + ", ho_start=" + ho_start + ", ho_end=" + ho_end
				+ ", ho_rm_count=" + ho_rm_count + ", ho_use_count=" + ho_use_count + ", emp_no=" + emp_no + ", df_no="
				+ df_no + "]";
	}
	public String getHo_no() {
		return ho_no;
	}
	public void setHo_no(String ho_no) {
		this.ho_no = ho_no;
	}
	public String getHo_code() {
		return ho_code;
	}
	public void setHo_code(String ho_code) {
		this.ho_code = ho_code;
	}
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
	public String getHo_rm_count() {
		return ho_rm_count;
	}
	public void setHo_rm_count(String ho_rm_count) {
		this.ho_rm_count = ho_rm_count;
	}
	public String getHo_use_count() {
		return ho_use_count;
	}
	public void setHo_use_count(String ho_use_count) {
		this.ho_use_count = ho_use_count;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getDf_no() {
		return df_no;
	}
	public void setDf_no(String df_no) {
		this.df_no = df_no;
	}
	
	
	
}
