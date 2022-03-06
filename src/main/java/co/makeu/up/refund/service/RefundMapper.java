package co.makeu.up.refund.service;

import java.util.List;

public interface RefundMapper {
	int insertRefund(RefundVO vo);
	List<RefundVO> RefundList(RefundVO vo);
	List<RefundVO> RefundListSelect(RefundVO vo);
	List<RefundVO> adminRefundList(RefundVO vo);
	List<RefundVO> adminRefundListSearch(RefundVO vo);
	int updateRefund(RefundVO vo);
	int adRefCancleUpdate(RefundVO vo);
	List<RefundVO> RefundListByCreator(String id);
}
