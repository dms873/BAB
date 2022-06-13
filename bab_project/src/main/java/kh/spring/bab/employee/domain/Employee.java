package kh.spring.bab.employee.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Employee {

	//desc employee;
//	EMP_NO        NOT NULL VARCHAR2(30)  
//	EMP_NAME      NOT NULL VARCHAR2(30)  
//	EMP_ID        NOT NULL VARCHAR2(30)  
//	EMP_PWD       NOT NULL VARCHAR2(30)  
//	EMP_PHONE     NOT NULL VARCHAR2(30)  
//	EMP_EMAIL     NOT NULL VARCHAR2(100) 
//	EMP_ZIPCODE            VARCHAR2(30)  
//	EMP_ADDRESS   NOT NULL VARCHAR2(300) 
//	EMP_DADDRESS           VARCHAR2(100) 
//	EMP_RNUM      NOT NULL VARCHAR2(30)  
//	EMP_DESKPHONE          NUMBER(4)     
//	EMP_HIREDATE  NOT NULL TIMESTAMP(6)  
//	DEPT_CODE     NOT NULL VARCHAR2(30)  
//	JOB_CODE      NOT NULL VARCHAR2(30)  
	
	//변수 이름짓기
	private String emp_no;
	private String emp_name;
	private String emp_id;
	private String emp_pwd;
	private String emp_phone;
	private String emp_email;
	private String emp_zipcode;
	private String emp_address;
	private String emp_daddress;
	private String emp_rnum;
	private String emp_deskphone;
	private Timestamp emp_hiredate;
	private String dept_code;
	private String job_code;
	
	//toString
	@Override
	public String toString() {
		return "Employee [emp_no=" + emp_no + ", emp_name=" + emp_name + ", emp_id=" + emp_id + ", emp_pwd=" + emp_pwd
				+ ", emp_phone=" + emp_phone + ", emp_email=" + emp_email + ", emp_zipcode=" + emp_zipcode
				+ ", emp_address=" + emp_address + ", emp_daddress=" + emp_daddress + ", emp_rnum=" + emp_rnum
				+ ", emp_deskphone=" + emp_deskphone + ", emp_hiredate=" + emp_hiredate + ", dept_code=" + dept_code
				+ ", job_code=" + job_code + "]";
	}

	//게터세터
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

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_pwd() {
		return emp_pwd;
	}

	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_zipcode() {
		return emp_zipcode;
	}

	public void setEmp_zipcode(String emp_zipcode) {
		this.emp_zipcode = emp_zipcode;
	}

	public String getEmp_address() {
		return emp_address;
	}

	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}

	public String getEmp_daddress() {
		return emp_daddress;
	}

	public void setEmp_daddress(String emp_daddress) {
		this.emp_daddress = emp_daddress;
	}

	public String getEmp_rnum() {
		return emp_rnum;
	}

	public void setEmp_rnum(String emp_rnum) {
		this.emp_rnum = emp_rnum;
	}

	public String getEmp_deskphone() {
		return emp_deskphone;
	}

	public void setEmp_deskphone(String emp_deskphone) {
		this.emp_deskphone = emp_deskphone;
	}

	public Timestamp getEmp_hiredate() {
		return emp_hiredate;
	}

	public void setEmp_hiredate(Timestamp emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}

	public String getJob_code() {
		return job_code;
	}

	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}
	
	
}
