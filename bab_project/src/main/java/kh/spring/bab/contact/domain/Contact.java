package kh.spring.bab.contact.domain;

import org.springframework.stereotype.Component;

@Component
public class Contact {
	
	private String emp_name;
	private String dept_name;
	private String job_title;
	private String emp_phone;
	private String emp_deskphone;
	private String emp_hiredate;
	private String emp_email;
	private String emp_address;
	
	
	@Override
	public String toString() {
		return "Contact [emp_name=" + emp_name + ", dept_name=" + dept_name + ", job_title=" + job_title
				+ ", emp_phone=" + emp_phone + ", emp_deskphone=" + emp_deskphone + ", emp_hiredate=" + emp_hiredate
				+ ", emp_email=" + emp_email + ", emp_address=" + emp_address + "]";
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


	public String getEmp_phone() {
		return emp_phone;
	}


	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}


	public String getEmp_deskphone() {
		return emp_deskphone;
	}


	public void setEmp_deskphone(String emp_deskphone) {
		this.emp_deskphone = emp_deskphone;
	}


	public String getEmp_hiredate() {
		return emp_hiredate;
	}


	public void setEmp_hiredate(String emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}


	public String getEmp_email() {
		return emp_email;
	}


	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}


	public String getEmp_address() {
		return emp_address;
	}


	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}
	
}
