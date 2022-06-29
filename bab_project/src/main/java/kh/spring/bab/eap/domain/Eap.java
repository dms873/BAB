package kh.spring.bab.eap.domain;

import org.springframework.stereotype.Component;

@Component
public class Eap {

	private String eap_no; // 결재번호
	private String eap_step; // 결재선단계
	private String eap_title; // 결재제목
	private String eap_content; // 결재내용
	private String eap_sta_code; // 결재상태구분
	private String eap_res_code; // 결재결과구분
	private String eap_reject; // 반려사유
	private String eap_first_ap; // 최초승인자
	private String eap_mid_ap; // 중간승인자
	private String eap_final_ap; // 최종승인자
	private String eap_first_dept; // 최초참조부서
	private String eap_final_dept; // 최종참조부서
	private String eap_draft_date; // 기안일
	private String eap_result_date; // 결재일
	private String eap_update_date; // 수정일
	private String emp_no; // 사원번호
	private String df_no; // 문서양식번호
	private String df_code; // 문서양식코드
	private String dept_name; // 부서명
	private String job_title; // 직위명
	private String emp_name; // 사원명
	private String df_title; // 문서명
	private String emp_phone; // 사원전화번호
	private String eap_file_path; // 파일 경로
	
	@Override
	public String toString() {
		return "Eap [eap_no=" + eap_no + ", eap_step=" + eap_step + ", eap_title=" + eap_title + ", eap_content="
				+ eap_content + ", eap_sta_code=" + eap_sta_code + ", eap_res_code=" + eap_res_code + ", eap_reject="
				+ eap_reject + ", eap_first_ap=" + eap_first_ap + ", eap_mid_ap=" + eap_mid_ap + ", eap_final_ap="
				+ eap_final_ap + ", eap_first_dept=" + eap_first_dept + ", eap_final_dept=" + eap_final_dept
				+ ", eap_draft_date=" + eap_draft_date + ", eap_result_date=" + eap_result_date + ", eap_update_date="
				+ eap_update_date + ", emp_no=" + emp_no + ", df_no=" + df_no + ", df_code=" + df_code + ", dept_name="
				+ dept_name + ", job_title=" + job_title + ", emp_name=" + emp_name + ", df_title=" + df_title
				+ ", emp_phone=" + emp_phone + ", eap_file_path=" + eap_file_path + "]";
	}
	public String getEap_no() {
		return eap_no;
	}
	public void setEap_no(String eap_no) {
		this.eap_no = eap_no;
	}
	public String getEap_step() {
		return eap_step;
	}
	public void setEap_step(String eap_step) {
		this.eap_step = eap_step;
	}
	public String getEap_title() {
		return eap_title;
	}
	public void setEap_title(String eap_title) {
		this.eap_title = eap_title;
	}
	public String getEap_content() {
		return eap_content;
	}
	public void setEap_content(String eap_content) {
		this.eap_content = eap_content;
	}
	public String getEap_sta_code() {
		return eap_sta_code;
	}
	public void setEap_sta_code(String eap_sta_code) {
		this.eap_sta_code = eap_sta_code;
	}
	public String getEap_res_code() {
		return eap_res_code;
	}
	public void setEap_res_code(String eap_res_code) {
		this.eap_res_code = eap_res_code;
	}
	public String getEap_reject() {
		return eap_reject;
	}
	public void setEap_reject(String eap_reject) {
		this.eap_reject = eap_reject;
	}
	public String getEap_first_ap() {
		return eap_first_ap;
	}
	public void setEap_first_ap(String eap_first_ap) {
		this.eap_first_ap = eap_first_ap;
	}
	public String getEap_mid_ap() {
		return eap_mid_ap;
	}
	public void setEap_mid_ap(String eap_mid_ap) {
		this.eap_mid_ap = eap_mid_ap;
	}
	public String getEap_final_ap() {
		return eap_final_ap;
	}
	public void setEap_final_ap(String eap_final_ap) {
		this.eap_final_ap = eap_final_ap;
	}
	public String getEap_first_dept() {
		return eap_first_dept;
	}
	public void setEap_first_dept(String eap_first_dept) {
		this.eap_first_dept = eap_first_dept;
	}
	public String getEap_final_dept() {
		return eap_final_dept;
	}
	public void setEap_final_dept(String eap_final_dept) {
		this.eap_final_dept = eap_final_dept;
	}
	public String getEap_draft_date() {
		return eap_draft_date;
	}
	public void setEap_draft_date(String eap_draft_date) {
		this.eap_draft_date = eap_draft_date;
	}
	public String getEap_result_date() {
		return eap_result_date;
	}
	public void setEap_result_date(String eap_result_date) {
		this.eap_result_date = eap_result_date;
	}
	public String getEap_update_date() {
		return eap_update_date;
	}
	public void setEap_update_date(String eap_update_date) {
		this.eap_update_date = eap_update_date;
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
	public String getDf_code() {
		return df_code;
	}
	public void setDf_code(String df_code) {
		this.df_code = df_code;
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
	public String getDf_title() {
		return df_title;
	}
	public void setDf_title(String df_title) {
		this.df_title = df_title;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}
	public String getEap_file_path() {
		return eap_file_path;
	}
	public void setEap_file_path(String eap_file_path) {
		this.eap_file_path = eap_file_path;
	}
	
}
