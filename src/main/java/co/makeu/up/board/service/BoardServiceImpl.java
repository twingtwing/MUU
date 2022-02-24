package co.makeu.up.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper map;

	@Override
	public List<BoardVO> selectBoardList() {
		return map.selectBoardList();
	}
	
	@Override
	public List<BoardVO> selectTtlList(BoardVO vo) {
		return map.selectTtlList(vo);
	}
	
}
