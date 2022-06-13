package kh.spring.bab.employee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.employee.domain.Employee;
import kh.spring.bab.employee.model.dao.EmployeeDao;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeDao dao;
	
	public List<Employee> selectEmp() {
		return dao.selectEmp();
	}

}
