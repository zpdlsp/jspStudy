package kr.or.nextit.mber.service.impl;

import java.sql.Connection;

import com.sun.javafx.binding.StringFormatter;

import kr.or.nextit.jdbc.ConnectionPool;
import kr.or.nextit.mber.service.MberService;
import kr.or.nextit.mber.service.MberVo;

public class MberServiceImpl implements MberService {

	private ConnectionPool pool = ConnectionPool.getInstance();
	private MberServiceDao dao = MberServiceDao.getInstance();
	
	@Override
	public MberVo getMemberItem(String memID) {
		Connection conn = null;
		try {
			conn = pool.getConnection();
			
			MberVo result = dao.getMemberItem(conn, memID);
			result.setState(true);
			result.setMessage("정상처리");
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			
			MberVo result =new MberVo();
			result.setState(false);
			result.setMessage(e.getMessage());
			
			return result;
		} finally {
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

	@Override
	public MberVo updateMemberItem(
			String memID,
			String memPW,
			String memName,
			String memNickname,
			String memAddr) {
		
		MberVo params = new MberVo();
		params.setMemID(memID);
		params.setMemPW(memPW);
		params.setMemName(memName);
		params.setMemNickname(memNickname);
		params.setMemAddr(memAddr);
		
		Connection conn = null;
		
		try {
			conn = pool.getConnection();
			int result = dao.updateMemberItem(conn, params);
			if(result > 0) {
				params.setState(true);
				params.setMessage(
						String.format("%d 건이 처리되었습니다", result));
			} else {
				throw new Exception(
						String.format("%d 처리된 결과가 없습니다", result));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			params.setState(false);
			params.setMessage(e.getMessage());
		} finally {
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch(Exception e) {
				}
			}
		}
		
		return params;
	}

	@Override
	public boolean deleteMemberItem(String memID) {
		
		Connection conn = null;
		
		try {
			conn = pool.getConnection();
			int result = dao.deleteMemberItem(conn, memID);
			System.out.println(result);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if(conn != null) {
				pool.releaseConnection(conn);
			}
		}
		
	}

}
