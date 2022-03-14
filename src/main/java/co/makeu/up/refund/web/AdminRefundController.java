package co.makeu.up.refund.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.PageVo;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;

@Controller
public class AdminRefundController {
	Logger logger = LoggerFactory.getLogger(AdminRefundController.class);
	
	@Autowired RefundServiceImpl refundDao;
	
	@GetMapping("/admin/adRef")
	public String adRefSearch(RefundVO vo,Model model) {
		List<RefundVO> arslist = refundDao.adminRefundListSearch(vo);
		model.addAttribute("adminRefundLists", arslist);
		int length = 0;
	      if(arslist.size() != 0) {
	         length = arslist.get(0).getLength();
	      }
		model.addAttribute("pageMaker",new PageVo(vo,length));
		model.addAttribute("search",vo);
		return "admin/all/adRef";
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/adRefUpdate" , method=RequestMethod.POST)
	public Map<String, Object> adRefUpdate(RefundVO been, HttpServletResponse response) {
		System.out.println("되냐??");
		Map<String, Object> map= new HashMap<>();
		map.put("tlsnNo", been.getTlsnNo());
		map.put("usePoint", been.getUsePoint());
		map.put("Point", been.getPoint());
		map.put("Id", been.getId());
		refundDao.updateRefund(map);
		System.out.println("여기까지 작동하냐?");
		return map;		
	}
	
	@ResponseBody
	@PostMapping("/admin/adRefCancleUpdate")
	public int adRefCancleUpdate(RefundVO vo) {
		int result = refundDao.adRefCancleUpdate(vo);
		return result;		
	}
}