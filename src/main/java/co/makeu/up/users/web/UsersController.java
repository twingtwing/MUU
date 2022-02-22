package co.makeu.up.users.web;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class UsersController {
	@Autowired
	UsersServiceImpl usersDao;
	@Inject
	BCryptPasswordEncoder pwEncoder;
	
	@PostMapping("/login")
	public void login(UsersVO vo) {
	}
	
	@PostMapping("/logout")
	public void logout() {
	}
	
	@PostMapping("/signup")
	public String signup(UsersVO vo) {
		String pw = pwEncoder.encode(vo.getPw());
		vo.setPw(pw);
		usersDao.insertUsers(vo);
		return "main/all/home";
	}
	
	@GetMapping("/forget")
	public String forget() {
		return "main/all/forget";
	}
	
	@ResponseBody
	@GetMapping("/idchk")
	public boolean idchk(UsersVO vo) {
		String id = usersDao.ajaxChkId(vo.getId());
		if(id==null) {
			return true;
		} else {
			return false;
		}
	}
}
