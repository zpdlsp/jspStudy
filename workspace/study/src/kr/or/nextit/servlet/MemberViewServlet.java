package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.member.MemberService;
import kr.or.nextit.member.MemberVo;
import kr.or.nextit.member.impl.MemberServiceImpl;

@WebServlet(name = "MemberVeiwServlet", urlPatterns = {"/memberView.next"})
public class MemberViewServlet extends HttpServlet {

	private MemberService memberService;
	
	@Override
	public void init() throws ServletException {
	
		memberService = new MemberServiceImpl();
		
		super.init();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("회원 목록 출력");

//		MemberVo memberVo = new MemberVo();
//		
//		try {
//			List<MemberVo> memberList = memberService.getMemberList(memberVo);
//			req.setAttribute("memberList", memberList);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		String userID = req.getParameter("userID");
		
		try {
			MemberVo memberResult = memberService.getMemberItem(userID);
			req.setAttribute("memberInfo", memberResult);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
			//throw new ServletException(e.getMessage(), e);	// 하나만 처리 가능
			throw new IOException(e.getMessage(), e);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/17/MemberVeiwServlet.jsp");
		dispatcher.forward(req, resp);
	}

}
