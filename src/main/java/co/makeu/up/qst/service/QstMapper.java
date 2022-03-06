package co.makeu.up.qst.service;

import java.util.List;

public interface QstMapper {
	int QstInsert(QstVO vo);
	List<QstVO> qstSelectList(QstVO vo);
	QstVO qstSelect(int qstNo);
	int qstUpdateStCode(QstVO vo);
}
