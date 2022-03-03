package co.makeu.up.ltqna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ltqnaDao")
public class LtQnaServiceImpl implements LtQnaMapper{
	@Autowired LtQnaMapper map;
	
	@Override
	public List<LtQnaVO> selectQnaList(LtQnaVO vo) {
		return map.selectQnaList(vo);
	}

	@Override
	public int qnaListCnt(int ltNo) {
		return map.qnaListCnt(ltNo);
	}

	@Override
	public int insertQna(LtQnaVO vo) {
		return map.insertQna(vo);
	}

	@Override
	public LtQnaVO selectQna(int qnaNo) {
		return map.selectQna(qnaNo);
	}

	@Override
	public List<LtQnaVO> selectMyQnaList(LtQnaVO vo) {
		return map.selectMyQnaList(vo);
	}

	@Override
	public int updateMyQna(LtQnaVO vo) {
		return map.updateMyQna(vo);
	}

	@Override
	public int deleteMyQna(int qnaNo) {
		return map.deleteMyQna(qnaNo);
	}

}
