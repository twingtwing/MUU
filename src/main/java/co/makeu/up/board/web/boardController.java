package co.makeu.up.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class boardController {
	
	@GetMapping("/boardL")
	public String boardL() {
		return "main/all/boardL";
	}
	
	@GetMapping("/boardS")
	public String boardS() {
		return "main/all/boardS";
	}
}
