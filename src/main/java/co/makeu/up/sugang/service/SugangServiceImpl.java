package co.makeu.up.sugang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sugangDao")
public class SugangServiceImpl implements SugangMapper {
	@Autowired SugangMapper map;
	
	@Override
	public List<SugangVO> sugangSelectList(String id) {
		return map.sugangSelectList(id);
	}

	@Override
	public SugangVO sugangCheckDate(SugangVO vo) {
		return map.sugangCheckDate(vo);
	}

	@Override
	public int sugangRefundUpdate(int tlsnNo) {
		return map.sugangRefundUpdate(tlsnNo);
	}

	@Override
	public int sugangBeforeRefund(SugangVO vo) {
		return map.sugangBeforeRefund(vo);
	}

	@Override
	public List<SugangVO> sugangPay(SugangVO vo) {
		return map.sugangPay(vo);
	}

	@Override
	public int updateSugangConfirm(SugangVO vo) {
		return map.updateSugangConfirm(vo);
	}

	@Override
	public List<SugangVO> userRefundList(String id) {
		return map.userRefundList(id);
	}

	@Override
	public int sugangInsert(SugangVO vo) {
		return map.sugangInsert(vo);
	}

	@Override
	public List<SugangVO> adminSugangList(int ltNo) {
		return map.adminSugangList(ltNo);
	}

	@Override
	public SugangVO adminSugangCount(int ltNo) {
		return map.adminSugangCount(ltNo);
	}

	@Override
	public List<SugangVO> adminLecUserList(SugangVO vo) {
		return map.adminLecUserList(vo);
	}

	@Override
	public List<SugangVO> adminLecDeliver(SugangVO vo) {
		return map.adminLecDeliver(vo);
	}

	@Override
	public List<SugangVO> sugangList(SugangVO vo) {
		return map.sugangList(vo);
	}

	@Override
	public int shipUpdate(SugangVO vo) {
		return map.shipUpdate(vo);
	}

	@Override
	public SugangVO selectSugang(int tlsnNo) {
		return map.selectSugang(tlsnNo);
	}

}
