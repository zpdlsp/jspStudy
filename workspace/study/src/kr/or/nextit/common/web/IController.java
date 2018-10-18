package kr.or.nextit.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IController {

	/**
	 * 페이지를 리다이렉트 처리할 지 안할 지 여부
	 * @return
	 */
	public boolean isRedirect();
	
	/**
	 * 비지니스(업무) 처리 레이어 영역
	 * @param req
	 * @param resp
	 * @return 해당하는 프로세스가 실행되고 뷰단으로 넘겨주는 녀석
	 * @throws Exception
	 */
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
