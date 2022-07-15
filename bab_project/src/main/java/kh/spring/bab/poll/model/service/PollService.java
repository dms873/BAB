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
	public Poll readPoll(String poll_no);
	
	// 옵션 상세조회
	/**
	 * @param poll_no
	 * @author 장혜미
	 */
	public List<Poll> readOption(String poll_no);
	
	// 옵션 상세조회
	/**
	 * @param poll_no
	 * @author 장혜미
	 */
	public List<Poll> readResult(String poll_no);
	
	// 투표 여부 확인
	/**
	 * @param poll
	 * @author 장혜미
	 */
	public Poll voteCk(Poll poll);

	// 투표 하기
	/**
	 * @param poll
	 * @author 장혜미
	 */
	public int vote(Poll poll);

}
