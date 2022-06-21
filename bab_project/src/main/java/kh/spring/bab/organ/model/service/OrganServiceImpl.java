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
	
	@Override
	// 조직도에서 상세 직원 정보 조회
	public Organ selectDetailInfo(String emp_no) {
		return dao.selectDetailInfo(emp_no);
	}

	// 결재선 리스트에 있는 사원 번호를 가져와 결재선jsp에 이름, 부서, 직책 조회
	@Override
	public Organ selectInfo(String emp_no) {
		return dao.selectInfo(emp_no);
	}

	// 휴가 신청서 문서 번호 조회
	@Override
	public Organ selectDoc(String df_code) {
		return dao.selectDoc(df_code);
	}
	
	
}
