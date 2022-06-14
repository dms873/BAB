package kh.spring.bab.employee.model.service;

import kh.spring.bab.employee.domain.Employee;

public interface EmployeeService {

	// 로그인
	public Employee login(Employee employee);

	// 아이디찾기
	public Employee findid(Employee employee);

	// 비밀번호찾기
	public Employee findpwd(Employee employee);

}
