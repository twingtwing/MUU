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
	public List<BoardVO> selectBoardList(BoardVO vo) {
		return map.selectBoardList(vo);
	}
	
	@Override
	public List<BoardVO> selectTtlList(BoardVO vo) {
		return map.selectTtlList(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		vo = map.selectBoard(vo);
		 
		if(vo.getFileNo() != -1) {
			vo.setDetaFileList(fileMap.detaFileList(vo.getFileNo()));
		}
		//조회수 올라가는 update를 넣어야함
		map.upboard(vo);
		
		return vo;
	}

	@Override
	public List<BoardVO> selectadbad() {
		// TODO Auto-generated method stub
		return map.selectadbad();
	}
	
	
}
