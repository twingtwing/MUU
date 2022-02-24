package co.makeu.up.faq.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
}
