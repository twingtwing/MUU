package co.makeu.up;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorPageController {
	@GetMapping("/error404")
	public String Error404(HttpServletResponse response, Model model) {
		model.addAttribute("num","404");
		model.addAttribute("msg","페이지를 찾을 수 없습니다.");
		return "error/error";
	}
	
	@GetMapping("/error500")
	public String Error500(HttpServletResponse response, Model model) {
		model.addAttribute("num","500");
		model.addAttribute("msg","알 수 없는 문제가 발생했습니다.");
		return "error/error";
	}
	
	@GetMapping("/error400")
	public String Error400(HttpServletResponse response, Model model) {
		model.addAttribute("num","400");
		model.addAttribute("msg","잘못된 요청입니다.");
		return "error/error";
	}
}
