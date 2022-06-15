package kh.spring.bab.employee.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.bab.employee.domain.Employee;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlSession sqlSession;

	// 로그인
	public Employee login(Employee employee) {
		return sqlSession.selectOne("Employee.login", employee);
	}

	// 아이디 찾기
	public Employee findid(Employee employee) {
		return sqlSession.selectOne("Employee.findid", employee);
	}

	// 비밀번호 찾기
	public Employee findpwd(Employee employee) {
		return sqlSession.selectOne("Employee.findpwd", employee);
	}

}
