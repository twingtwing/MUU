package co.makeu.up.faq.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.PageVo;
import co.makeu.up.faq.service.FaqServiceImpl;
import co.makeu.up.faq.service.FaqVO;

@Controller
public class FaqController {
	
	@Autowired FaqServiceImpl faqDao;
	
	@GetMapping("/faq")
	public String FAQ() {
		return "main/all/faq";
	}
	
	@GetMapping("/refundRule")
	public String refundRule() {
		return "main/all/refundRule";
	}
	
	@ResponseBody
	@PostMapping("/faqSelectList")
	public List<FaqVO> faqSelectList() {
		return faqDao.faqSelectList();
	}
	
	@ResponseBody
	@PostMapping("/faqSelectListSearch")
	public List<FaqVO> faqSelectListSearch(FaqVO vo) {
		return faqDao.faqListSearch(vo);
	}
	
	//admin faq
	@GetMapping("/admin/adFaqL")
	public String adFaqL(FaqVO vo,Model model) {
		List<FaqVO> list = faqDao.faqList(vo);
		model.addAttribute("list",list);
		int length = 0;
		if(list.size() != 0) {
			length = list.get(0).getLength();
		}
		model.addAttribute("pageMaker",new PageVo(vo,length));
		model.addAttribute("search", vo);
		return "admin/all/adFaqL";
	}
	@ResponseBody
	@PostMapping("/admin/insertfaq")
	public String insertfaq(FaqVO vo) {
		int r = 0;
		r+=faqDao.insertfaq(vo);
		
		String res = "N";
		
		if(r == 1) {
			res = "Y";
		}
		return res ;
	}
	@ResponseBody
	@PostMapping("/admin/upfaq")
	public String upfaq(FaqVO vo) {
		int r = 0 ;
		r+=faqDao.upfaq(vo);
		String res = "N";
		if (r == 1) {
			res = "T";
		}
		return res;	
	}
	@ResponseBody
	@PostMapping("/admin/delfaq")
	public String delfaq(FaqVO vo) {
		int r = 0;
		r+=faqDao.delfaq(vo);
		
		String z = "N";
		if(r == 1) {
			z = "z";
		}
		return z;
		
	}
	
}
