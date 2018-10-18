package kr.or.nextit.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.board.service.BoardService;
import kr.or.nextit.board.service.BoardVo;
import kr.or.nextit.board.service.impl.BoardServiceImpl;
import kr.or.nextit.common.web.IController;

public class BoardUpdateFormController implements IController {

	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		BoardVo param = new BoardVo();
		param.setSeqNo(req.getParameter("seqNo"));
		
		BoardVo boardItem = boardService.getBoardItem(param);
		
		req.setAttribute("boardItem", boardItem);
		
		return "/board/BoardUpdateForm";
	}

}
