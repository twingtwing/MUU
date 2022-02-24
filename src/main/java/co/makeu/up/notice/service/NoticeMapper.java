package co.makeu.up.notice.service;

import java.util.List;

public interface NoticeMapper {
	List<NoticeVO> NoticeList();
	NoticeVO NoticeSelect(int ntno);
}
