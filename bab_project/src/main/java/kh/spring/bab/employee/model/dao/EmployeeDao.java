package kh.spring.bab.employee.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.employee.model.vo.Employee;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Employee> selectEmp() {
		return sqlSession.selectList("Employee.selectEmp");
	}
	
	
}
