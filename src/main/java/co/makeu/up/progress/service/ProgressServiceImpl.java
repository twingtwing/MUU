package co.makeu.up.progress.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("progressDao")
public class ProgressServiceImpl implements ProgressMapper {
	@Autowired ProgressMapper map;
	@Override
	public int insertProgress(ProgressVO vo) {
		return map.insertProgress(vo);
	}
	@Override
	public ProgressVO selectProgress(ProgressVO vo) {
		return map.selectProgress(vo);
	}
	@Override
	public int updateProgress(ProgressVO vo) {
		return map.updateProgress(vo);
	}
	@Override
	public int wholeProgress(ProgressVO vo) {
		return map.wholeProgress(vo);
	}
	@Override
	public int countBeforeRefund(ProgressVO vo) {
		return map.countBeforeRefund(vo);
	}

}
