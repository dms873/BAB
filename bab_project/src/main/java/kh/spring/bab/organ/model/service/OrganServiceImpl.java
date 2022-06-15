package kh.spring.bab.organ.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.organ.domain.Organ;
import kh.spring.bab.organ.model.dao.OrganDao;

@Service
public class OrganServiceImpl implements OrganService {

	@Autowired
	private OrganDao dao;
	
	// 조직도에 넣을 이름, 부서명, 직위명 조회
	@Override
	public List<Organ> selectOrganList() {
		return dao.selectOrganList();
	}
	
	// 조직도에 넣을 부서 코드, 부서명 조회
	@Override
	public List<Organ> selectDeptList() {
		return dao.selectDeptList();
	}
	
	// 조직도에 넣을 직위명 조회
	@Override
	public List<Organ> selectJobList() {
		return dao.selectJobList();
	}
	
	
}
