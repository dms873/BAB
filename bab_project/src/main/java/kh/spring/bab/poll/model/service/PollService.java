package kh.spring.bab.poll.model.service;

import java.util.List;

import kh.spring.bab.poll.domain.Poll;

public interface PollService {
	
	// 투표 조회
	/**
	 * @param poll
	 * @return poll
	 * @author 장혜미
	 */
	public List<Poll> select(Poll poll);

	// 투표 등록
	/**
	 * @param poll
	 * @author 장혜미
	 */
	public int insertPoll(Poll poll);
	
	// 옵션 등록
	/**
	 * @param poll
	 * @author 장혜미
	 */
	public int insertOption(Poll poll);

	// 투표 상세조회
	/**
	 * @param poll_no
	 * @author 장혜미
	 */
	public Poll read(String poll_no);

	// 투표 수정
	/**
	 * @param poll
	 * @author 장혜미
	 */
	public int update(Poll poll);

	// 투표 삭제
	/**
	 * @param poll_no
	 * @author 장혜미
	 */
	public int delete(String poll_no);

}
