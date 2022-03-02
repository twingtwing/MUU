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

}
