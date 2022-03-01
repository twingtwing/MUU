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
	public BoardVO insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.insertBoard(vo);
	}

	@Override
	public List<BoardVO> selectadbads() {
		// TODO Auto-generated method stub
		return map.selectadbads();
	}

	@Override
	public String deladbad(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.deladbad(vo);
	}
	
	
}
