package kr.or.nextit.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.nextit.login.service.LoginVo;

public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
	
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		// 로그인 페이지를 적용하지 않을 URI 주소목록
		String[] ch = {"/13/loginForm.jsp","/13/loginProc.jsp",
						"/14/memberInsertForm.jsp","/14/memberInsertProc.jsp"};
		boolean chFlag = false;
		
		for(String chUri : ch) {
			System.out.println(chUri);
			if(uri.equals(chUri)) {
				chFlag = true;
			}
		}
		
		
		LoginVo loginInfo = (LoginVo) session.getAttribute("loginInfo");
		
		if(loginInfo != null) {
			System.out.println(loginInfo);
			System.out.println(loginInfo.getUserID());
			System.out.println(loginInfo.getUserName());
			chain.doFilter(req, resp);
		} else {
			System.out.println("로그인 해주세요");
			// 이동시킬 주소
			if(chFlag) {
				chain.doFilter(req, resp);
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/13/loginForm.jsp");
				dispatcher.forward(req, resp);
			}
		}
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}	

}
