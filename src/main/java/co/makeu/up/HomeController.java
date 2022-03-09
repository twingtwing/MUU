package co.makeu.up;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.sales.service.SalesServiceImpl;
import co.makeu.up.sales.service.SalesVO;

@Controller
public class HomeController {	
	@Autowired SalesServiceImpl salesDao;
	
	@GetMapping("/home")
	public String home() {
		return "main/all/home";
	}
	
	// 관리자 메인
	@GetMapping("/admin/home")
	public String adminPage(Model model) {
		model.addAttribute("lec3",salesDao.lectureTop3());
		model.addAttribute("cre3",salesDao.creatorTop3());
		model.addAttribute("countList",salesDao.countList());
		return "admin/home/home";
	}
	
	@GetMapping("/admin/recent7Chart")
	@ResponseBody
	public List<SalesVO> getRecent7Chart(){
		List<SalesVO> list = salesDao.recent7days();
		return list;
	}
	
	@GetMapping("/admin/salesThisyear")
	@ResponseBody
	public List<SalesVO> thisyear(){
		return salesDao.thisYearSales();
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
