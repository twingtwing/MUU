package co.makeu.up.users.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CreatorController {
	@GetMapping("/creator/creLectureReview")
	public String creLectureReview() {
		return "main/creator/cLecR";
	}
	@GetMapping("/creator/creRefund")
	public String creRefund() {
		return "main/creator/creR";
	}
	@GetMapping("/creator/creSaleYear")
	public String creSalesYear() {
		return "main/creator/creSaYear";
	}
	@GetMapping("/creator/creSaleMonth")
	public String creSalesMonth() {
		return "main/creator/creSaMonth";
	}
	@GetMapping("/creator/creSaleLec")
	public String creSaleLec() {
		return "main/creator/creSaLec";
	}
}
