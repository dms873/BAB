package kh.spring.bab.info.model.service;

import kh.spring.bab.info.domain.Info;

public interface InfoService {

	// 내정보수정 메인
	/**
	 * @param info
	 * @return info
	 * @author 장혜미
	 */
	public Info main(Info info);

	// 내정보수정 업데이트
	/**
	 * @param info
	 * @return info
	 * @author 장혜미
	 */
	public Info update(Info info);

}
