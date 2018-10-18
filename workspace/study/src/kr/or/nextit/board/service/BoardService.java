package kr.or.nextit.board.service;

import java.util.List;

public interface BoardService {
	
	/**
	 * Board 글 등록
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public boolean insertBoardItem(BoardVo boardVo) throws Exception;
	
	/**
	 * Board List 구현
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public List<BoardVo> getBoardList(BoardVo boardVo) throws Exception;
	
	/**
	 * 1건을 조회
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	public BoardVo getBoardItem(BoardVo boardVo) throws Exception;
	
	/**
	 * 삭제기능
	 * @param seqNo
	 * @throws Exception
	 */
	public void deleteBoardItem(String seqNo) throws Exception;
	
	public void updateBoardItem(BoardVo boardVo) throws Exception;
	
}
