package co.makeu.up.qst.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("QstDao")
public class QstServiceImpl implements QstService {
	
	@Autowired
	private QstMapper map;

	@Override
	public int QstInsert(QstVO vo) {
		return map.QstInsert(vo);
	}

}
