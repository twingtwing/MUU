package co.makeu.up.board.service;

import java.util.List;

public interface BoardService {

	List<BoardVO> selectBoardList();//공지사항 list - main
	BoardVO selectBoard(BoardVO vo);//단건 조회

	List<BoardVO> selectadbad(BoardVO vo);
	int insertBoard(BoardVO vo);
	BoardVO selectadbads(BoardVO vo);
	int deladbad(BoardVO vo);
	int upadbad(BoardVO vo);

}
