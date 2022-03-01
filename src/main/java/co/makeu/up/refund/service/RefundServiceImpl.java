package co.makeu.up.refund.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("refundDao")
public class RefundServiceImpl implements RefundMapper {

	@Autowired RefundMapper map;
	
	@Override
	public int insertRefund(RefundVO vo) {
		return map.insertRefund(vo);
	}

}
