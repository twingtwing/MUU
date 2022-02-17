package co.makeu.up;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/*아직 컨트롤러 이름이나 경로같은거 안정함 !! 이건 임시임 !!*/
@Controller
public class HomeController {
	
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
	
	
}
