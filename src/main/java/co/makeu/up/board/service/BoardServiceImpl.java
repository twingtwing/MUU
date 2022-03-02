package co.makeu.up.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.detafile.service.DetafileMapper;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardMapper map;
	@Autowired private DetafileMapper fileMap;

	@Override
	public List<BoardVO> selectBoardList() {
		return map.selectBoardList();
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		vo = map.selectBoard(vo);
		if(vo.getFileNo() != -1) {
			vo.setDetaFileList(fileMap.detaFileList(vo.getFileNo()));
		}
		map.upboard(vo);
		return vo;
	}

	@Override
	public List<BoardVO> selectadbad() {
		return map.selectadbad();
	}

	@Override
	public int insertBoard(BoardVO vo) {
		return map.insertBoard(vo);
	}

	@Override
	public BoardVO selectadbads(BoardVO vo) {
		return map.selectadbads(vo);
	}

	@Override
	public int deladbad(BoardVO vo) {
		return map.deladbad(vo);
	}

	@Override
	public int upadbad(BoardVO vo) {
		return map.upadbad(vo);
	}
	
	
}
