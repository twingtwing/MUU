package co.makeu.up.files.service;

import co.makeu.up.board.service.BoardVO;
import co.makeu.up.notice.service.NoticeVO;

public interface FileMapper {
	int insertFile(BoardVO vo);
	int insertFile(NoticeVO vo);
	
	int delFile(int fileNo);
}
