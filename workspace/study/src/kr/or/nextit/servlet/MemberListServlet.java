package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.member.MemberService;
import kr.or.nextit.member.MemberVo;
import kr.or.nextit.member.impl.MemberServiceImpl;

@WebServlet(name="MemberListServlet", urlPatterns= {"/memberList.next"},
		initParams= {
				@WebInitParam(name="test1", value="valueTest1"),
				@WebInitParam(name="test2", value="valueTest2"),
				@WebInitParam(name="test3", value="valueTest3")
				})
public class MemberListServlet extends HttpServlet {

	private MemberService memberService;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		System.out.println("===== MemberListServlet 시작 =====");
		
		// member Service 인스턴스 생성
		memberService = new MemberServiceImpl();
		
		System.out.println(config.getInitParameter("test"));
		
		Enumeration<String> params = config.getInitParameterNames();
		
		while(params.hasMoreElements()) {
			String paramName = (String)params.nextElement();
			System.out.printf("paramName : %s, paramValue : %s\n", 
						paramName, 
						config.getInitParameter(paramName));
		}
		
		super.init(config);
		System.out.println("===== MemberListServlet 종료 =====");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("회원 목록 출력");
		
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head>");
		out.print("<title>회원 목록</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>회원 목록입니다</h1>");
		
		MemberVo memberVo = new MemberVo();
		try {
			List<MemberVo> memberResult = memberService.getMemberList(memberVo);
			
			out.print("<table class=\"table\" border = 2>");
			out.print("<tbody>");			
			for(MemberVo memberItem : memberResult) {
				out.print("<tr>");
				
				out.printf("<td><a href=\"/memberView.next?userID=%s\"> %s </a></td>", 
							memberItem.getUserID(),
							memberItem.getUserID());
				
				
				out.printf("<td> %s </td>", memberItem.getUserName());
				out.printf("<td> %s </td>", memberItem.getUserPW());
				out.printf("<td> %s </td>", memberItem.getUserHP());
				out.printf("<td> %s </td>", memberItem.getUserEmail());
				out.print("</tr>");
			}
			out.print("</tbody>");
			out.print("</table>");
		} catch (Exception e) {
			e.printStackTrace();
			out.printf("error Message : %s", e.getMessage());
		}
		
		out.print("</body>");
		out.print("</html>");
		
	}
	
}
