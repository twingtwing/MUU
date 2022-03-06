package co.makeu.up.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int updateHits(int ntNo) {
		return map.updateHits(ntNo);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		return map.insertNotice(vo);
	}

	
}
