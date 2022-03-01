package co.makeu.up.board.service;

import java.util.List;

public interface BoardMapper {
	List<BoardVO> selectBoardList();//공지사항 list - main
	int upboard(BoardVO vo);
	BoardVO selectBoard(BoardVO vo);//단건 조회
	List<BoardVO> selectadbad();
}
