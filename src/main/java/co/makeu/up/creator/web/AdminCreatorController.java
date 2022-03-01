package co.makeu.up.creator.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminCreatorController {

	//admin list
	@GetMapping("/admin/adCreL")
	public String adCreL() {
		return "admin/all/adCreL";
	}
	
	//admin Select
	@GetMapping("/admin/adCreS")
	public String adCreS() {
		return "admin/all/adCreS";
	}
	
}
