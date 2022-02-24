package co.makeu.up.users.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class UsersPageController {
	@Autowired
	UsersServiceImpl usersDao;
	
	@GetMapping("/user/userLL")
	public String userLectureList() {
		return "main/user/userLL";
	}
	@GetMapping("/user/userS")
	public String userSelect(Principal pri, UsersVO vo, Model model) {
		vo.setId(pri.getName());
		vo = usersDao.selectUsers(vo);
		model.addAttribute("user", vo);
		return "main/user/userS";
	}
	@GetMapping("/user/userU")
	public String userUpdateForm(UsersVO vo,Model model) {
		// userS 페이지에서 정보 그대로 넘기기
		return "main/user/userU";
	}
	
	@GetMapping("/user/userLQ")
	public String userLecQuestion() {
		return "main/user/userLQ";
	}
	@GetMapping("/user/userLR")
	public String userLecReview() {
		return "main/user/userLR";
	}
	@GetMapping("/user/userR")
	public String userRefund() {
		return "main/user/userR";
	}
	@GetMapping("/user/userLW")
	public String userWatch() {
		return "main/user/userLW";
	}
}
