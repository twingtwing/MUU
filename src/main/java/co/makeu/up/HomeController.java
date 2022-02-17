package co.makeu.up;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {	
	
	@Inject
	BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/home")
	public String home() {
		return "main/all/home/home";
	}
	
	@GetMapping("/admin/home")
	public String adminPage() {
		return "admin/home/home";
	}
	
	
	@GetMapping("/customLogin")
	public String customLoginForm(String error, String logout, Model model) {	
		return "main/all/home/customLogin";
	}
	
	@PostMapping("/login")
	public void login() {	
		
	}
	
	@GetMapping("/signupForm")
	public String signupForm() {
		return "main/all/home/signup";
	}
	
	@PostMapping("/signup")
	public String signup() {
		String pw = pwEncoder.encode("여기에 usersVO pw 들어가면 암호화됨");
		return "main/all/home/home";
	}
	
	@GetMapping("/forget")
	public String forget() {
		return "main/all/home/forget";
	}
}
