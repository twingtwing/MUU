package co.makeu.up.refund.web;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;
import co.makeu.up.sugang.service.SugangServiceImpl;

@Controller
public class RefundController {
	Logger logger = LoggerFactory.getLogger(RefundController.class);
	
	@Autowired RefundServiceImpl refundDao;
	@Autowired SugangServiceImpl sugangDao;
	
	@PostMapping("/user/userRefundReq")
	@ResponseBody
	public String userRefund(RefundVO vo) {
		if(refundDao.insertRefund(vo) != 1) {
			return "환불할 수 없습니다.";
		} else {
			//sugangDao.sugangRefundUpdate(vo.getTlsnNo());
			return "환불 신청이 완료되었습니다.";			
		}
	}
	
	//크리에이터 강의환불내역조회
	@GetMapping("/creator/creRefund")
	public String creRefund(RefundVO vo, Model model, Principal pri) {
		vo.setPage(0);
		vo.setCre_id(pri.getName());
		List<RefundVO> rlist = refundDao.RefundList(vo);
		int listCnt = rlist.get(0).getCount();
		System.out.println(listCnt + "작동했나?");
		Pagination pagination = new Pagination(listCnt,1);
		model.addAttribute("ltno", vo.getLtNo());
		model.addAttribute("pagination",pagination);
		model.addAttribute("refundlists", rlist);
		return "main/creator/creR";
	}
	
	@ResponseBody
	@GetMapping("/creator/creRefundPage")
	public List<RefundVO> creRefundPage(RefundVO vo){
		 logger.info(vo.getCre_id()+"page는"+vo.getPage());
		 return refundDao.RefundList(vo);
	}
	
	@ResponseBody
	@GetMapping("/creator/creRefundSearch")
	public List<RefundVO> creRefundSearch(RefundVO vo){
		 return refundDao.RefundList(vo);
	}
	
	@ResponseBody
	@GetMapping("/creator/creRefundSelect")
	public List<RefundVO> creRefundSelect(RefundVO vo){
		 return refundDao.RefundListSelect(vo);
	}
}
