package co.makeu.up;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.extendedLecture.service.ExtendedLectureVO;
import co.makeu.up.extendedLecture.service.ExtendedLetureService;
import co.makeu.up.sales.service.SalesServiceImpl;
import co.makeu.up.sales.service.SalesVO;

@Controller
public class HomeController {	
	@Autowired SalesServiceImpl salesDao;
	@Autowired ExtendedLetureService extendedDao;
	
	@GetMapping("/home")
	public String home(Model model) {
		model.addAttribute("random",extendedDao.randomLecture());
		return "main/all/home";
	}
	
	//메인
	@ResponseBody
	@GetMapping("/homeLecture")
	public ExtendedLectureVO homeLecture(ExtendedLectureVO vo,Principal pri) {
		if(pri != null) {
			vo.setId(pri.getName());
		}
		return extendedDao.extendHome(vo);
	}
	//메인 끝
	
	// 관리자 메인
	@GetMapping("/admin/home")
	public String adminPage(Model model,SalesVO vo) {
		model.addAttribute("home",salesDao.adminHome(vo));
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

	@ResponseBody
	@GetMapping("/admin/genderList")
	public List<SalesVO> genderList(){
		return salesDao.genderList();
	}
	//관리자 메인 끝
	
	@GetMapping("/customLogin")
	public String customLoginForm(String error, String logout, Model model, HttpServletRequest request) {
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
