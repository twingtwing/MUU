package co.makeu.up.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.files.service.FilesVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeMapper{
	@Autowired NoticeMapper map;
	
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
		return map.insertNotice(vo);
	}

	@Override
	public int deleteNotice(NoticeVO vo) {
		return map.deleteNotice(vo);
  }
   
  @Override
	public List<FilesVO> noticeFiles(int ltNo) {
		return map.noticeFiles(ltNo);
	}

@Override
public List<NoticeVO> adminNoticeList(NoticeVO vo) {
	return map.adminNoticeList(vo);
}

	
}
