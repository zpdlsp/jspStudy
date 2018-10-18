package kr.or.nextit.function.service.impl;

import java.util.List;

import kr.or.nextit.function.service.CommCodeVo;

public interface ComMapper {

	/**
	 * 아이피 목록 조회
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<CommCodeVo> getIpList(
			CommCodeVo params
			) throws Exception;

	/**
	 * 클라이언트 IP 정보를 입력 받아 vo
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public CommCodeVo getIpItem(CommCodeVo param) throws Exception;
	
	/**
	 * 요청된 IP가 데이터 베이스에 없을 경우 등록
	 * @param paramCode
	 * @throws Exception
	 */
	public void insertIpItem(CommCodeVo paramCode) throws Exception;

}







