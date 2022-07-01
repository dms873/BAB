package kh.spring.bab.eap.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.bab.attendance.domain.Attendance;
import kh.spring.bab.eap.domain.Eap;
import kh.spring.bab.eap.domain.Spending;
import kh.spring.bab.eap.model.dao.EapDao;

@Service
public class EapServiceImpl implements EapService {

	@Autowired
	private EapDao dao;
	
	// 문서양식-휴가신청서일 때
	@Override
	public int insertHoDoc() {
		return dao.insertHoDoc();
	}

	// 문서양식-지출결의서일 때
	@Override
	public int insertSpDoc() {
		return dao.insertSpDoc();
	}

	// 문서양식 번호 조회
	@Override
	public Eap selectDoc(String df_code) {
		return dao.selectDoc(df_code);
	}

	// 결재선 리스트, 참조처 리스트 DB 저장(휴가신청서)
	@Override
	public int insertapp(Eap eap) {
		return dao.insertapp(eap);
	}

	// 전자결재 테이블 update(휴가신청서 작성 시)
	@Override
	public int updateeap(Eap eap) {
		return dao.updateeap(eap);
	}

	// 휴가테이블 insert
	@Override
	public int insertatt(Attendance att) {
		return dao.insertatt(att);
	}

	// 지출테이블 insert
	@Override
	public int insertSp(Spending sp) {
		return dao.insertSp(sp);
	}

	// 전자결재테이블 update(지출결의서 작성 시)
	@Override
	public int updateEapSp(Eap eap) {
		return dao.updateEapSp(eap);
	}
	
	// 결재선 리스트, 참조처 리스트 DB 저장(지출결의서)
	@Override
	public int insertappsp(Eap eap) {
		return dao.insertappsp(eap);
	}

	// 결재대기문서
	@Override
	public List<Eap> selectBeforeDoc(int currentPage, int pageSize, Eap eap) {
		return dao.selectBeforeDoc(currentPage, pageSize, eap);
	}
	
	// 결재 대기 문서 리스트 개수
	@Override
	public int beforeTotalCnt(Eap eap) {
		return dao.beforeTotalCnt(eap);
	}

	// 양식 처음 로드 시 띄울 정보
	@Override
	public Eap empInfo(String emp_no) {
		return dao.empInfo(emp_no);
	}

	// 문서 상세 조회(휴가신청서)
	@Override
	public Eap readHoDoc(String df_no) {
		return dao.readHoDoc(df_no);
	}

	// 첫번째 승인자 정보
	@Override
	public Eap selectFirstAp(Eap result) {
		return dao.selectFirstAp(result);
	}
	
	// 두번째 승인자 정보
	@Override
	public Eap selectMidAp(Eap result) {
		return dao.selectMidAp(result);
	}
	
	// 세번째 승인자 정보
	@Override
	public Eap selectFinalAp(Eap result) {
		return dao.selectFinalAp(result);
	}
	
	// 휴가신청서에 저장된 정보 가져오기
	@Override
	public Attendance selectHoInfo(Attendance att) {
		return dao.selectHoInfo(att);
	}
	
	// 문서 상세 조회(지출결의서)
	@Override
	public Eap readSpDoc(String df_no) {
		return dao.readHoDoc(df_no);
	}
	
	// 지출결의서에 저장된 정보 가져오기
	@Override
	public Spending selectSpInfo(Spending sp) {
		return dao.selectSpInfo(sp);
	}
	
	// 남은 휴가일수 확인
	@Override
	public Double readHoCnt(String emp_no) {
		return dao.readHoCnt(emp_no);
	}

	// 결재 회수
	@Override
	public int cancelDoc(String df_no) {
		return dao.cancelDoc(df_no);
	}

	// 문서 수정(지출결의서)
	@Override
	public int updateSpDoc(Spending sp) {
		return dao.updateSpDoc(sp);
	}

	// 문서 수정(전자결재 테이블)
	@Override
	public int updateEap(Eap eap) {
		return dao.updateEap(eap);
	}
	
	// 문서 수정(휴가신청서)
	@Override
	public int updateHpDoc(Attendance att) {
		return dao.updateHpDoc(att);
	}
	
	// 서브메뉴에 띄울 결재 대기 문서 개수
	@Override
	public int beDocCnt(String emp_no) {
		return dao.beDocCnt(emp_no);
	}

	// 결재 수신 문서
	@Override
	public List<Eap> selectReceiptDoc(int currentPage, int pageSize, Eap eap) {
		return dao.selectReceiptDoc(currentPage, pageSize, eap);
	}
	
	// 결재 수신 문서 리스트 개수
	@Override
	public int receiptTotalCnt(Eap eap) {
		return dao.receiptTotalCnt(eap);
	}
	
	// 서브 메뉴에 띄울 결재 수신 문서 개수
	@Override
	public int reDocCnt(String emp_no) {
		return dao.reDocCnt(emp_no);
	}

	// 결재 승인(결재자가 1명일 때)
	@Override
	public int updateOneApp(Eap eap) {
		return dao.updateOneApp(eap);
	}
	
	// 결재 승인(결재자가 2명 이상일 때)
	@Override
	public int updateEapApp(Eap eap) {
		return dao.updateEapApp(eap);
	}
	
	// 결재 반려(결재자가 1명일 때)
	@Override
	public int updateOneRej(Eap eap) {
		return dao.updateOneRej(eap);
	}
	
	// 결재 반려(결재자가 2명 이상일 때)
	@Override
	public int updateEapRej(Eap eap) {
		return dao.updateEapRej(eap);
	}
	
	// 기안 문서함
	@Override
	public List<Eap> selectInsertDoc(int currentPage, int pageSize, Eap eap) {
		return dao.selectInsertDoc(currentPage, pageSize, eap);
	}
	
	// 기안 문서함 리스트 개수
	@Override
	public int insertTotalCnt(Eap eap) {
		return dao.insertTotalCnt(eap);
	}
	
	// 결재 문서함
	@Override
	public List<Eap> selectResultDoc(int currentPage, int pageSize, Eap eap) {
		return dao.selectResultDoc(currentPage, pageSize, eap);
	}
	
	// 결재 문서함 리스트 개수
	@Override
	public int resultTotalCnt(Eap eap) {
		return dao.resultTotalCnt(eap);
	}
	
	// 참조 문서함
	@Override
	public List<Eap> selectReferenceDoc(int currentPage, int pageSize, Eap eap) {
		return dao.selectReferenceDoc(currentPage, pageSize, eap);
	}
	
	// 참조 문서함 리스트 개수
	@Override
	public int referenceTotalCnt(Eap eap) {
		return dao.referenceTotalCnt(eap);
	}
	
	// 전자결재 홈 전자 결재 대기
	@Override
	public List<Eap> selectHomeBeDoc(String emp_no) {
		return dao.selectHomeBeDoc(emp_no);
	}
	
	// 전자결재 홈 기안 진행 문서
	@Override
	public List<Eap> selectHomeRcDoc(String emp_no) {
		return dao.selectHomeRcDoc(emp_no);
	}

}
