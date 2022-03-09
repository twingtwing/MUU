package co.makeu.up.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.detafile.service.DetafileMapper;
import co.makeu.up.detafile.service.DetafileVO;
import co.makeu.up.files.service.FileMapper;
import co.makeu.up.files.service.FilesVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeMapper{
	@Autowired NoticeMapper map;
	@Autowired DetafileMapper detafileMap;
	@Autowired FileMapper fileMap;
	
	@Override
	public List<NoticeVO> NoticeList(NoticeVO vo) {
		return map.NoticeList(vo);
	}

	@Override
	public NoticeVO NoticeSelect(NoticeVO vo) {
		return map.NoticeSelect(vo);
	}

	@Override
	public int NoticeListCnt(int ltNo) {
		return map.NoticeListCnt(ltNo);
	}

	@Override
	public int updateHits(NoticeVO vo) {
		return map.updateHits(vo);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		if(vo.getDetaFileList() != null) {
			fileMap.insertFile(vo);
			for (DetafileVO detaVO : vo.getDetaFileList()) {
				detaVO.setFileNo(vo.getFileNo());
				detafileMap.detaFileInsert(detaVO);
			}
		}
		return map.insertNotice(vo);
	}

	@Override
	public int deleteNotice(NoticeVO vo) {
		fileMap.delFile(vo.getFileNo());
		return map.deleteNotice(vo);
  }
   
  @Override
	public List<FilesVO> noticeFiles(int ltNo) {
		return map.noticeFiles(ltNo);
	}

@Override
public NoticeVO NoticeSelects(NoticeVO vo) {
	vo = map.NoticeSelects(vo);
	if(vo.getFileNo() != -1) {
		vo.setFileList(detafileMap.detaFileList(vo.getFileNo()));
	}
	return vo;
}

@Override
public int NoticeUpdate(NoticeVO vo) {
	if(vo.getDetaFileList() != null) {
		fileMap.delFile(vo.getFileNo());
		fileMap.insertFile(vo);
		for (DetafileVO detaVO : vo.getDetaFileList()) {
			detaVO.setFileNo(vo.getFileNo());
			detafileMap.detaFileInsert(detaVO);
		}
	}
	return map.NoticeUpdate(vo);
}
@Override
public List<NoticeVO> adminNoticeList(NoticeVO vo) {
	return map.adminNoticeList(vo);
}

	
}
