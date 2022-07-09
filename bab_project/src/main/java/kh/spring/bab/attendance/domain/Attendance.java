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
	private String att_no; // 근태번호
	private String att_start; // 근무 시작 일시
	private String att_end; // 근무 종료 일시
	private String att_worktime; // 소정 근무 시간
	private String rnum; // NO 출력용 rownum
	private String emp_ho_cr_cnt; // 총 연차 일수
	private String eap_content; // 연차 사용 내역
	private String emp_name; // 사원명
	private String dept_name; // 부서명
	private String job_title; // 직위명
	private String emp_file_path; // 프로필 사진
	
	@Override
	public String toString() {
		return "Attendance [ho_no=" + ho_no + ", ho_code=" + ho_code + ", ho_start=" + ho_start + ", ho_end=" + ho_end
				+ ", ho_rm_count=" + ho_rm_count + ", ho_use_count=" + ho_use_count + ", emp_no=" + emp_no + ", df_no="
				+ df_no + ", att_no=" + att_no + ", att_start=" + att_start + ", att_end=" + att_end + ", att_worktime="
				+ att_worktime + ", rnum=" + rnum + ", emp_ho_cr_cnt=" + emp_ho_cr_cnt + ", eap_content=" + eap_content
				+ ", emp_name=" + emp_name + ", dept_name=" + dept_name + ", job_title=" + job_title
				+ ", emp_file_path=" + emp_file_path + "]";
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
	public String getAtt_no() {
		return att_no;
	}
	public void setAtt_no(String att_no) {
		this.att_no = att_no;
	}
	public String getAtt_start() {
		return att_start;
	}
	public void setAtt_start(String att_start) {
		this.att_start = att_start;
	}
	public String getAtt_end() {
		return att_end;
	}
	public void setAtt_end(String att_end) {
		this.att_end = att_end;
	}
	public String getAtt_worktime() {
		return att_worktime;
	}
	public void setAtt_worktime(String att_worktime) {
		this.att_worktime = att_worktime;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getEmp_ho_cr_cnt() {
		return emp_ho_cr_cnt;
	}
	public void setEmp_ho_cr_cnt(String emp_ho_cr_cnt) {
		this.emp_ho_cr_cnt = emp_ho_cr_cnt;
	}
	public String getEap_content() {
		return eap_content;
	}
	public void setEap_content(String eap_content) {
		this.eap_content = eap_content;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getEmp_file_path() {
		return emp_file_path;
	}
	public void setEmp_file_path(String emp_file_path) {
		this.emp_file_path = emp_file_path;
	}
	
}
