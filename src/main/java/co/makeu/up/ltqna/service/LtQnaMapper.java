package co.makeu.up.ltqna.service;

import java.util.List;

public interface LtQnaMapper {
	List<LtQnaVO> selectQnaList(LtQnaVO vo);
	List<LtQnaVO> selectMyQnaList(LtQnaVO vo);
	int qnaListCnt(int ltNo);
	LtQnaVO selectQna(int qnaNo);
	int insertQna(LtQnaVO vo);
}
