package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="GuguDan", urlPatterns= {"/guguDan.test"})
public class GuGuDanServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String flag = req.getParameter("flag");
		
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head>");
		out.print("<title>구구단</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>구구단</h1>");
//		out.print("<div>");
//		for(int i = 2; i <=9; i++) {
//			out.print(String.format("<h3>===== %d 단 =====</h3>", i));
//			for(int j = 1; j <= 9; j++) {
//				out.print(String.format("%d * %d = %d <br>", i, j, (i*j)));
//			}
//		}
//		out.print("</div>");
		
		
		out.print("<table border = 2>");
		out.print(flag.equals("left") ? "<tr style=\"text-align: center;\">" : "");
		for(int i = 2; i <=9; i++) {
			out.print("left".equals(flag) ? "<td>" : "<tr style=\"text-align: center;\"><td>");
			for(int j = 1; j <= 9; j++) {
				out.print(String.format("%d * %d = %d <br>", i, j, (i*j)));	
			}
			out.print("left".equals(flag) ? "</td>" : "</td></tr>");
		}
		out.print((flag.equals("left") ? "</tr>" : "" ));
		out.print("</table>");
		
		out.print("</body>");
		out.print("</html>");
		
		
	}
}
