package co.makeu.up.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> selectBoardList(BoardVO vo);
	List<BoardVO> selectTtlList(BoardVO vo);
	BoardVO selectBoard(BoardVO vo);//�떒嫄� 議고쉶
	List<BoardVO> selectadbad();
	BoardVO insertBoard(BoardVO vo);
	List<BoardVO> selectadbads();
	String deladbad(BoardVO vo);
}
