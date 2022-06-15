package kh.spring.bab.employee.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.employee.domain.Employee;
import kh.spring.bab.employee.model.dao.EmployeeDao;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao dao;

	// 아이디찾기
	/**
	 * @param employee
	 * @return
	 * @author 장혜미
	*/
	@Override
	public Employee findid(Employee employee) {
		return dao.findid(employee);
	}

	// 비밀번호찾기
	/**
	 * @param employee
	 * @return
	 * @author 장혜미
	*/
	@Override
	public Employee findpwd(Employee employee) {
		return dao.findpwd(employee);
	}

	// 로그인
	/**
	 * @param employee
	 * @return
	 * @author 장혜미
	*/
	@Override
	public Employee login(Employee employee) {
		// TODO Auto-generated method stub
		return null;
	}


}
