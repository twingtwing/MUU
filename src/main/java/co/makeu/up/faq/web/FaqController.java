package co.makeu.up.faq.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {
	
	@GetMapping("/faq")
	public String FAQ() {
		return "main/all/faq";
	}
	
	@GetMapping("/refundRule")
	public String refundRule() {
		return "main/all/refundRule";
	}
}
