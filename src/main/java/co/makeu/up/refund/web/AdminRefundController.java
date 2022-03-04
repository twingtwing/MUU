package co.makeu.up.refund.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.PageVo;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;
import co.makeu.up.sugang.service.SugangServiceImpl;

@Controller
public class AdminRefundController {
	Logger logger = LoggerFactory.getLogger(AdminRefundController.class);
	
	@Autowired RefundServiceImpl refundDao;

	@GetMapping("/admin/adRef")
	public String adRef(RefundVO vo,Model model) {
		List<RefundVO> arlist = refundDao.adminRefundList(vo);
		model.addAttribute("adminRefundLists", arlist);
		int length = 0;
	      if(arlist.size() != 0) {
	         length = arlist.get(0).getLength();
	      }
		model.addAttribute("pageMaker",new PageVo(vo,length));
		return "admin/all/adRef";
	}
	
	@GetMapping("/admin/adRefSearch")
	public String adRefSearch(RefundVO vo,Model model) {
		List<RefundVO> arslist = refundDao.adminRefundListSearch(vo);
		model.addAttribute("adminRefundLists", arslist);
		int length = 0;
	      if(arslist.size() != 0) {
	         length = arslist.get(0).getLength();
	      }
		model.addAttribute("pageMaker",new PageVo(vo,length));
		return "admin/all/adRef";
	}
	
	@ResponseBody
	@PostMapping("/admin/adRefUpdate")
	public int adRefUpdate(RefundVO vo) {
		int result = refundDao.updateRefund(vo);
		return result;		
	}
	
	@ResponseBody
	@PostMapping("/admin/adRefCancleUpdate")
	public int adRefCancleUpdate(RefundVO vo) {
		int result = refundDao.adRefCancleUpdate(vo);
		return result;		
	}
}