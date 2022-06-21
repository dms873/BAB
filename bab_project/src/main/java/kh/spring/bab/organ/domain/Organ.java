package kh.spring.bab.organ.domain;

import org.springframework.stereotype.Component;

@Component
public class Organ {

	private String emp_name;
	private String emp_no;
	private String dept_name;
	private String dept_code;
	private String job_title;
	private String emp_deskphone;
	private String emp_email;
	private String emp_phone;
	private String df_no;
	

	@Override
	public String toString() {
		return "Organ [emp_name=" + emp_name + ", emp_no=" + emp_no + ", dept_name=" + dept_name + ", dept_code="
				+ dept_code + ", job_title=" + job_title + ", emp_deskphone=" + emp_deskphone + ", emp_email="
				+ emp_email + ", emp_phone=" + emp_phone + ", df_no=" + df_no + "]";
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getEmp_deskphone() {
		return emp_deskphone;
	}

	public void setEmp_deskphone(String emp_deskphone) {
		this.emp_deskphone = emp_deskphone;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getDf_no() {
		return df_no;
	}

	public void setDf_no(String df_no) {
		this.df_no = df_no;
	}
}
