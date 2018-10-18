package kr.or.nextit.servlet;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.binding.StringFormatter;

import kr.or.nextit.common.web.IController;

@WebServlet(name="comBoardServlet", urlPatterns= {"*.do"})
public class ComBoardServlet extends HttpServlet {

	private Map<String, IController> controllerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		
		System.out.println("ComBoardServlet.init()");
		
		//클래스패스에서 properties파일 검색
		ResourceBundle bundle = ResourceBundle.getBundle("ComBoardMapper");
		
		// resource File (*.properties) 파일의 키값만 가지고 옴.
		Enumeration<String> keys = bundle.getKeys();
		
		// 가지고 온 키값의 목록을 갯수 만큼 반복
		while(keys.hasMoreElements()) {
			
			// trim() : 빈 공간 띄어쓰기가 되어 있으면 제거하고, 해당하는 값을 가지고 옴
			String key = keys.nextElement().trim();
			String value = bundle.getString(key).trim();
			
			
				try {
					// class.forName 으로 인터페이스에 해당하는 객체(class)를 찾아
					// Instance 생성(controller 변수에 생성)
					IController controller = (IController) Class.forName(value).newInstance();
					
					// controllerMap 객체에 등록(map.put properties 파일 키, 생성된 인스턴스 객체)
					controllerMap.put(key, controller);
					
					System.out.printf("%s 의 컨트롤 %s 등록\n", key, value);
				} catch (InstantiationException | 
						 IllegalAccessException | 
						 ClassNotFoundException e) {
					e.printStackTrace();
					throw new ServletException(e);
				}
				
			 
		}
		
		super.init();
	}
	
	@Override
	protected void service(
			HttpServletRequest req,
			HttpServletResponse resp
			) throws ServletException, IOException {
		
		//공통적으로 설정해야 할 부분(인코딩)
		req.setCharacterEncoding("UTF-8");
		
		try {
			// 사용자 요청을 분석 (URI 분석)
			String uri = req.getRequestURI();
			System.out.printf("사용자 요청 URI : %s\n", uri);
			// was contextPast를 제거해줌
			uri = uri.substring(req.getContextPath().length());
			System.out.printf("변경된 URI : %s\n", uri);
			
			Set<String> keys = controllerMap.keySet();
			
			// properties 파일에서 uri에서 요청된 값이 등록되었는지 true/false 값을 반환
			if(controllerMap.containsKey(uri)) {
				// map 객체에 등록된 키값으로 해당하는 생성된 인스턴스를 가지고 옴.
				IController controller = controllerMap.get(uri);
				String viewPage = controller.process(req, resp);
				
				if(controller.isRedirect()) {
					resp.sendRedirect(viewPage);
				}else {	
					RequestDispatcher dispatcher = 
							req.getRequestDispatcher(
										String.format("/WEB-INF/view%s.jsp", viewPage)
									);
					dispatcher.forward(req, resp);
				}
				
			} else {
				// 요청에 대한 컨트롤러가 없는 경우, 404에러
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
			}
			
//			for(String key : keys) {
//				System.out.printf("key : %s\n", key);
//				
//				if(uri.equals(key)) {
//					IController controller = controllerMap.get(key);
//					controller.process(req, resp);
//				} else {
//					resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
//				}
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	
	}
	
}
