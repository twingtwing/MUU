package co.makeu.up.refund.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;
import co.makeu.up.sugang.service.SugangServiceImpl;

@Controller
public class RefundController {
	@Autowired RefundServiceImpl refundDao;
	@Autowired SugangServiceImpl sugangDao;
	
	@PostMapping("/user/userRefundReq")
	@ResponseBody
	public String userRefund(RefundVO vo) {
		if(refundDao.insertRefund(vo) != 1) {
			return "환불할 수 없습니다.";
		} else {
			sugangDao.sugangRefundUpdate(vo.getTlsnNo());
			return "환불이 완료되었습니다.";			
		}
	}
}
