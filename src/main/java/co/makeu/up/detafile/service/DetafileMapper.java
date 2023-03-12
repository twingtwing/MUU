package co.makeu.up.detafile.service;

import java.util.List;

public interface DetafileMapper {
	
	List<DetafileVO> detaFileList(int fileNo);
	int detaFileInsert(DetafileVO vo);
	int delFeilDelete(int fileNo);
}
