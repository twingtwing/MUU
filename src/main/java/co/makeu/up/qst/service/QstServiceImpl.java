package co.makeu.up.qst.service;

import java.util.List;

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

	@Override
	public List<QstVO> qstSelectList(QstVO vo) {
		return map.qstSelectList(vo);
	}

	@Override
	public QstVO qstSelect(int qstNo) {
		return map.qstSelect(qstNo);
	}

	@Override
	public int qstUpdateStCode(QstVO vo) {
		return map.qstUpdateStCode(vo);
	}

}
