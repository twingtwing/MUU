package co.makeu.up.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> selectBoardList(BoardVO vo);
	List<BoardVO> selectTtlList(BoardVO vo);
	BoardVO selectBoard(BoardVO vo);//단건 조회
	List<BoardVO> selectadbad();
	 
}
