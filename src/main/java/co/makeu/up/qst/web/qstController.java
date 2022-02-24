package co.makeu.up.qst.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class qstController {
	
	@GetMapping("/qna")
	public String inquiry() {
		return "main/all/qna";
	}
}
