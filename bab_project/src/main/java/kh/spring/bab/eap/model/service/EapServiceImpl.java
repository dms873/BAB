package kh.spring.bab.eap.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.model.dao.EapDao;

@Service
public class EapServiceImpl implements EapService {

	@Autowired
	private EapDao dao;
	
	@Override
	public int insertHoDoc() {
		return dao.insertHoDoc();
	}

	@Override
	public int insertSpDoc() {
		return dao.insertSpDoc();
	}

	@Override
	public Eap selectDoc(String df_code) {
		return dao.selectDoc(df_code);
	}

}
