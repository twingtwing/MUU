package co.makeu.up.board.service;

import java.util.List;

public interface BoardService {

	List<BoardVO> selectBoardList();//공지사항 list - main
	BoardVO selectBoard(BoardVO vo);//단건 조회

	List<BoardVO> selectadbad();
	BoardVO insertBoard(BoardVO vo);
	List<BoardVO> selectadbads();
	String deladbad(BoardVO vo);
}
