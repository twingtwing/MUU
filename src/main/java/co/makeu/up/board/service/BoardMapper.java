package co.makeu.up.board.service;

import java.util.List;

public interface BoardMapper {
	List<BoardVO> selectBoardList(BoardVO vo);
	List<BoardVO> selectTtlList(BoardVO vo);
	int upboard(BoardVO vo);
	BoardVO selectBoard(BoardVO vo);//단건 조회
	List<BoardVO> selectadbad();
}
