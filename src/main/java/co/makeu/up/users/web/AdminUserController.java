package co.makeu.up.users.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminUserController {

	@GetMapping("/admin/adUserL")
	public String adUserL() {
		return "admin/all/adUserL";
	}
	
	@GetMapping("/admin/adUserS")
	public String adUserS() {
		return "admin/all/adUserS";
	}
}
