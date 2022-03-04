package co.makeu.up.creator.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class AdminCreatorController {
	@Autowired UsersServiceImpl userDao;
	
	//admin list
	@GetMapping("/admin/adCreL")
	public String adCreL(UsersVO vo, Model model) {
		vo.setPage(0);
		vo.setId("");
		vo.setName("");
		vo.setAuthCode("A03");
		Pagination pagination = new Pagination(userDao.creatorsCount(),1);
		model.addAttribute("creators",userDao.usersList(vo));
		model.addAttribute("pages",pagination);
		return "admin/all/adCreL";
	}
	
	//admin Select
	@GetMapping("/admin/adCreS")
	public String adCreS() {
		return "admin/all/adCreS";
	}
	
}
