package co.makeu.up.notice.service;

import java.util.List;

public interface NoticeMapper {
	List<NoticeVO> NoticeList(NoticeVO vo);
	int NoticeListCnt(int ltNo);
	NoticeVO NoticeSelect(NoticeVO vo);
	int updateHits(NoticeVO vo);
	int insertNotice(NoticeVO vo);
	int deleteNotice(NoticeVO vo);
}
