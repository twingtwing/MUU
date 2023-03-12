package co.makeu.up.refund.service;

import java.util.List;
import java.util.Map;

public interface RefundMapper {
	int insertRefund(RefundVO vo);
	List<RefundVO> RefundList(RefundVO vo);
	List<RefundVO> RefundListSelect(RefundVO vo);
	List<RefundVO> adminRefundList(RefundVO vo);
	List<RefundVO> adminRefundListSearch(RefundVO vo);
	List<RefundVO> adminRefundListSearchPlus(RefundVO vo);
	void updateRefund(Map map);
	/* int updateRefund(RefundVO vo); */
	int adRefCancleUpdate(RefundVO vo);
	List<RefundVO> RefundListByCreator(String id);
}
