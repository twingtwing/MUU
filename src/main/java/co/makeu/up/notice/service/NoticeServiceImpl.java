package co.makeu.up.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeMapper{
	@Autowired NoticeMapper map;
	
	@Override
	public List<NoticeVO> NoticeList() {
		return map.NoticeList();
	}

	@Override
	public NoticeVO NoticeSelect(int ntno) {
		return map.NoticeSelect(ntno);
	}
	
}
