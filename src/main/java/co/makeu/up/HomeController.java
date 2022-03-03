package co.makeu.up;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {	
	
	@GetMapping("/home")
	public String home() {
		return "main/all/home";
	}
	
	@GetMapping("/admin/home")
	public String adminPage() {
		return "admin/home/home";
	}
	
	
	@GetMapping("/customLogin")
	public String customLoginForm(String error, String logout, Model model) {
		if(error!=null) {
			model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
		}
		return "main/all/customLogin";
	}
	
	

	
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		model.addAttribute("msg","잘못된 접근입니다.");
		return "error/accessError";
	}
	
	@GetMapping("/signupForm")
	public String signupForm() {
		return "main/all/signup";
	}
	
}
