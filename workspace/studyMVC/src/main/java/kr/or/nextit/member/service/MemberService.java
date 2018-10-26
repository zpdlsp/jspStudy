package kr.or.nextit.member.service;

import java.util.HashMap;
import java.util.List;

public interface MemberService {

	/**
	 * test 서비스 메소드
	 * @return List<HashMap<String, Object>>
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> getMemberListMap() throws Exception;

	/**
	 * Vo 객체로 반환
	 * @return
	 * @throws Exception
	 */
	public List<MemberVo> getMemberListVo(MemberSearchVo memberSearchVo) throws Exception;
	
	/**
	 * 검색을 기준으로 조회된 전제 카운트를 구하는 메소드
	 * @param memberSearchVo
	 * @return
	 * @throws Exception
	 */
	public int getMemberTotalCnt(MemberSearchVo memberSearchVo) throws Exception;
	
	/**
	 * memId 정보를 받아 해당정보를 가져오는 기능(1건 db pk)
	 * @param memberSearchVo
	 * @return
	 * @throws Exception
	 */
	public MemberVo selectMemberItem(MemberSearchVo memberSearchVo) throws Exception;
	
	/**
	 * memId 값을 문자열로 받아 삭제
	 * @param memId
	 * @return
	 * @throws Exception
	 */
	public boolean deleteMemberItem(String memId) throws Exception;
	
	/**
	 * HashMap 값을 데이터베이스에서 pk 조건으로 수정하는 기능
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public boolean updateMemberItem(HashMap<String, Object> params) throws Exception;
	
	/**
	 * 회원가입
	 * @param memberVo
	 * @return
	 * @throws Exception
	 */
	public boolean insertMemberItem(MemberVo memberVo) throws Exception;
}
