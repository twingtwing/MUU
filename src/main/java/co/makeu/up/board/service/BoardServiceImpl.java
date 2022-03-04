package co.makeu.up.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.detafile.service.DetafileMapper;
import co.makeu.up.detafile.service.DetafileVO;
import co.makeu.up.files.service.FileMapper;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardMapper map;
	@Autowired private DetafileMapper detafileMap;
	@Autowired private FileMapper fileMap;

	@Override
	public List<BoardVO> selectBoardList() {
		return map.selectBoardList();
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		vo = map.selectBoard(vo);
		if(vo.getFileNo() != -1) {
			vo.setDetaFileList(detafileMap.detaFileList(vo.getFileNo()));
		}
		map.upboard(vo);
		return vo;
	}

	@Override
	public List<BoardVO> selectadbad(BoardVO vo) {
		return map.selectadbad(vo);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		if(vo.getDetaFileList().size() !=0) {
			fileMap.insertFile(vo);
			for (DetafileVO detaVO : vo.getDetaFileList()) {
				detaVO.setFileNo(vo.getFileNo());
				detafileMap.detaFileInsert(detaVO);
			}
		}
		return map.insertBoard(vo);
	}

	@Override
	public BoardVO selectadbads(BoardVO vo) {
		vo = map.selectadbads(vo);
		if(vo.getFileNo() != -1) {
			vo.setDetaFileList(detafileMap.detaFileList(vo.getFileNo()));
		}
		return vo;
	}

	@Override
	public int deladbad(BoardVO vo) {
		return map.deladbad(vo);
	}

	@Override
	public int upadbad(BoardVO vo) {
		return map.upadbad(vo);
	}

	@Override
	public List<BoardVO> seradbad(BoardVO vo) {
		return map.seradbad(vo);
	}
	
	
}
