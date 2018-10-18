package kr.or.nextit.login.impl;

import javax.servlet.http.HttpServletRequest;

import kr.or.nextit.login.LoginService;
import kr.or.nextit.login.service.LoginVo;

public class LoginServiceImpl implements LoginService {

	@Override
	public void loginCheck(HttpServletRequest req) {
		
		String userID = req.getParameter("userID");
		String userPW = req.getParameter("userPW");
		
		if("master".equals(userID) && "12345".equals(userPW)){
			req.setAttribute("result", true);
			req.setAttribute("message", "로그인에 성공하였습니다.");
		} else {
			req.setAttribute("result", false);
			req.setAttribute("message", "아이디 또는 비밀번호가 틀렸습니다.");
			
		}
		
	}

	@Override
	public LoginVo loginCheck(String userID, String userPW) {
		
		LoginVo result = new LoginVo();
		
		try {
			if("admin".equals(userID) && "12345".equals(userPW)) {
				result.setUserID(userID);
				result.setUserPW("");
				result.setUserName("관리자");
				result.setUserEmail("admin@nextit.or.kr");
				result.setResult(true);
				result.setMessage("정상 로그인");
			} else {
				result.setUserID(userID);
				result.setUserPW("");
				result.setUserName("");
				result.setUserEmail("");
				result.setResult(false);
				result.setMessage("로그인 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setResult(false);
			result.setMessage(e.getMessage());
		}
		
		return result;
	}

}
