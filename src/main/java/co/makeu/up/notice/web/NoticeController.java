package co.makeu.up.notice.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	
	@GetMapping("/creator/cLecNL")
	public String cLecNL() {
		return "main/creator/cLecNL";
	}
	
	
	@GetMapping("/creator/cLecNS")
	public String cLecNS() {
		return "main/creator/cLecNS";
	}
	
	@GetMapping("/creator/cLecNI")
	public String cLecNI() {
		return "main/creator/cLecNI";
	}
	@GetMapping("/creator/cLecNU")
	public String cLecNU() {
		return "main/creator/cLecNU";
	}
	@GetMapping("/creator/cLecQ")
	public String cLecQ() {
		return "main/creator/cLecQ";
	}
}
