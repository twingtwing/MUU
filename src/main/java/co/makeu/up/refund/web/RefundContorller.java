package co.makeu.up.refund.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RefundContorller {

	@GetMapping("/admin/adRef")
	public String adRef() {
		return "admin/all/adRef";
	}
}
