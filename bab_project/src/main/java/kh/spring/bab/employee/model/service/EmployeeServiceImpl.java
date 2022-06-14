package kh.spring.bab.employee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.employee.domain.Employee;
import kh.spring.bab.employee.model.dao.EmployeeDao;

@Service
public class EmployeeServiceImpl implements EmployeeService  {
	
	@Autowired
	private EmployeeDao dao;
	
	@Override
	public Employee findid(Employee employee) {
		return dao.findid(employee);
	}

	@Override
	public Employee login(Employee employee) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee findpwd(Employee employee) {
		// TODO Auto-generated method stub
		return null;
	}


}
