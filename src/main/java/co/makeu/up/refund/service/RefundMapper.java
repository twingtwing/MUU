package co.makeu.up.refund.service;

import java.util.List;

public interface RefundMapper {
	int insertRefund(RefundVO vo);
	List<RefundVO> RefundList(RefundVO vo);
	List<RefundVO> RefundListSelect(RefundVO vo);
}
