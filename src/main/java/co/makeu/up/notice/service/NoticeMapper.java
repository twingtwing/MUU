package co.makeu.up.notice.service;

import java.util.List;

public interface NoticeMapper {
	List<NoticeVO> NoticeList(NoticeVO vo);
	int NoticeListCnt(int ltNo);
	NoticeVO NoticeSelect(int ntno);
}
