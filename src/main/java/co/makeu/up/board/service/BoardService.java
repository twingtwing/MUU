package co.makeu.up.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> selectBoardList();
	List<BoardVO> selectTtlList(BoardVO vo);
	 
}
