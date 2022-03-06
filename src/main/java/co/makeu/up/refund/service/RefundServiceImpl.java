package co.makeu.up.refund.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("refundDao")
public class RefundServiceImpl implements RefundMapper {

	@Autowired RefundMapper map;
	
	@Override
	public int insertRefund(RefundVO vo) {
		return map.insertRefund(vo);
	}

	@Override
	public List<RefundVO> RefundList(RefundVO vo) {
		return map.RefundList(vo);
	}

	@Override
	public List<RefundVO> RefundListSelect(RefundVO vo) {
		return map.RefundListSelect(vo);
	}

	@Override
	public List<RefundVO> adminRefundList(RefundVO vo) {
		return map.adminRefundList(vo);
	}

	@Override
	public List<RefundVO> adminRefundListSearch(RefundVO vo) {
		return map.adminRefundListSearch(vo);
	}

	@Override
	public int updateRefund(RefundVO vo) {
		return map.updateRefund(vo);
	}

	@Override
	public int adRefCancleUpdate(RefundVO vo) {
		return map.adRefCancleUpdate(vo);
	}

	@Override
	public List<RefundVO> RefundListByCreator(String id) {
		return map.RefundListByCreator(id);
	}
}
