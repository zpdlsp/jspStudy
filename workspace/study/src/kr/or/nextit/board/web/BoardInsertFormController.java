package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.common.web.IController;

public class BoardInsertFormController implements IController {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("BoardInsertFormController.process() 실행");
		return "/board/BoardInsertForm";
	}

}
