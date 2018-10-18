package kr.or.nextit.member.impl;

import java.util.HashMap;
import java.util.List;

import kr.or.nextit.member.MemberVo;

/**
 * 데이터 레이어 처리 영역
 * @author pc51
 *
 */
public interface MemberMapper {

	/**
	 * 데이터 회원 정보 목록을 받아오는 기능 
	 * @param memberVo
	 * @return
	 * @throws Exception
	 */
	public List<MemberVo> selectMemberList(MemberVo memberVo) throws Exception;
	
	/**
	 * 선택된 정보(userID) 가지고 회원 정보를 가지고 오는 기능
	 * @param userID
	 * @return
	 * @throws Exception
	 */
	public MemberVo selectMemberItem(String userID) throws Exception;
	
	public HashMap<String, Object> selectMemberInfo(
			HashMap<String, Object> params
			) throws Exception;
	
	public List<HashMap<String, Object>> selectMemberInfoList(
			HashMap<String, Object> params
			) throws Exception;
	
}