package co.makeu.up.sugang.service;

import java.util.List;

public interface SugangMapper {
	List<SugangVO> sugangSelectList(String id);
	SugangVO sugangCheckDate(SugangVO vo);
	int sugangRefundUpdate(int tlsnNo);
	int sugangBeforeRefund(SugangVO vo);
	List<SugangVO> sugangPay(SugangVO vo);
	int updateSugangConfirm(SugangVO vo);
	List<SugangVO> sugangList(SugangVO vo);
	int shipUpdate(SugangVO vo);
	SugangVO selectSugang(int tlsnNo);
	int sugangInsert(SugangVO vo);
	
	// admin
	List<SugangVO> userRefundList(String id);
	List<SugangVO> adminSugangList(int ltNo);
	SugangVO adminSugangCount(int ltNo);
	List<SugangVO> adminLecUserList(SugangVO vo);
	List<SugangVO> adminLecDeliver(SugangVO vo);
}
