package kr.or.nextit.mber.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.nextit.mber.service.MberVo;

public class MberServiceDao {

private static MberServiceDao instance = null;
	
	public static MberServiceDao getInstance() {
		if(instance == null) {
			instance = new MberServiceDao();
		}
		return instance;
	}
	
	public MberVo getMemberItem(Connection conn, String memID) throws SQLException {
		
		StringBuilder query = new StringBuilder();
		query.append("SELECT                    ");
		query.append("	mem_id,                 ");
		query.append("	mem_pw,                 ");
		query.append("	mem_name,               ");
		query.append("	mem_nickname,           ");
		query.append("	mem_addr,               ");
		query.append("	reg_date                ");
		query.append("FROM                      ");
		query.append("	tb_member1              ");
		query.append("WHERE		                ");		
		query.append("	mem_id = ?              ");		
		
		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, memID);
		
		ResultSet rs = pstmt.executeQuery();
		
		MberVo result = null;
		
		if(rs.next()) {
			result = new MberVo();
			result.setMemID(rs.getString("mem_id"));
			result.setMemPW(rs.getString("mem_pw"));
			result.setMemName(rs.getString("mem_name"));
			result.setMemNickname(rs.getString("mem_nickname"));
			result.setMemAddr(rs.getString("mem_addr"));
			result.setRegDate(rs.getString("reg_date"));
		}
		
		return result;
	}
	
	public int updateMemberItem(Connection conn, MberVo params) throws SQLException {
		
		StringBuilder query = new StringBuilder();

		query.append("UPDATE tb_member1   	 		");
		query.append("SET                 	 		");
		query.append("	  mem_pw   	   = ?,   		");
		query.append("    mem_name 	   = ?,   		");
		query.append("    mem_nickname = ?,	 		");
		query.append("    mem_addr	   = ?,   		");
		query.append("    reg_date	   = sysdate    ");
		query.append("WHERE                	 		");
		query.append("    mem_id 	   = ?   		");
		
		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, params.getMemPW());
		pstmt.setString(2, params.getMemName());
		pstmt.setString(3, params.getMemNickname());
		pstmt.setString(4, params.getMemAddr());
		pstmt.setString(5, params.getMemID());
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	public int deleteMemberItem(Connection conn, String memID) throws Exception {
		
		StringBuilder query = new StringBuilder();
		query.append("	DELETE FROM tb_member1 	  ");
		query.append("	WHERE                     ");
		query.append("	    mem_id = ?            ");

		PreparedStatement pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, memID);
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	
}
