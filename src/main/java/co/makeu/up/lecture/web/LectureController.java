package co.makeu.up.lecture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {
	
	@GetMapping("/lecI")
	public String lectureInsertPage() {
		return "main/lecture/lecI";
	}

}
