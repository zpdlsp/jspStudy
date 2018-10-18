package kr.or.nextit.mber.service;

public interface MberService {

	/**
	 * 회원 상세정보
	 * @param memID
	 * @return
	 */
	public MberVo getMemberItem(String memID); 
	
	/**
	 * 회원 정보 수정
	 * @param memID
	 * @param memPW
	 * @param memName
	 * @param memNickname
	 * @param memAddr
	 * @return
	 */
	public MberVo updateMemberItem(
			String memID, 
			String memPW, 
			String memName, 
			String memNickname,
			String memAddr
			);
	
	/**
	 * 회원 삭제
	 * @param memID
	 * @return
	 */
	public boolean deleteMemberItem(String memID);
	
}
