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
	
	// 조직도 사원 조회
	@Override
	public List<Organ> selectOrganList() {
		return dao.selectOrganList();
	}
	
	
}
