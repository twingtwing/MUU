package co.makeu.up.users.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class AdminUserController {
	@Autowired UsersServiceImpl usersDao;
	@GetMapping("/admin/adUserL")
	public String adUserL(Model model,UsersVO vo) {
		vo.setPage(0);
		List<UsersVO> list = usersDao.usersList(vo);
		Pagination pagination = new Pagination(list.size(), 1);
		model.addAttribute("pages",pagination);
		model.addAttribute("users", list);
		return "admin/all/adUserL";
		
	}
	
	@GetMapping("/admin/adUserS")
	public String adUserS() {
		return "admin/all/adUserS";
	}
	
	@GetMapping("/admin/userSearch")
	@ResponseBody
	public List<UsersVO> userSearch(UsersVO vo){
		return usersDao.usersList(vo);
	}
}
