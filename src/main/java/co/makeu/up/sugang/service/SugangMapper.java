package co.makeu.up.sugang.service;

import java.util.List;

public interface SugangMapper {
	List<SugangVO> sugangSelectList(String id);
	SugangVO sugangCheckDate(SugangVO vo);
	int sugangRefundUpdate(int tlsnNo);
	int sugangBeforeRefund(SugangVO vo);
	List<SugangVO> sugangPay(SugangVO vo);
	int updateSugangConfirm(SugangVO vo);
	
	int sugangInsert(SugangVO vo);
	
	// admin
	List<SugangVO> userRefundList(String id);
}
