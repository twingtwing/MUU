package co.makeu.up.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.makeu.up.notice.service.NoticeServiceImpl;

@Controller
public class NoticeController {
	@Autowired NoticeServiceImpl noticeDao;
	
	@GetMapping("/creator/cLecNL")
	public String cLecNL() {
		return "main/creator/cLecNL";
	}
	@GetMapping("/creator/cLecNS")
	public String cLecNS() {
		return "main/creator/cLecNS";
	}
	
	@GetMapping("/creator/cLecNI")
	public String cLecNI() {
		return "main/creator/cLecNI";
	}
	@GetMapping("/creator/cLecNU")
	public String cLecNU() {
		return "main/creator/cLecNU";
	}
	@GetMapping("/creator/cLecQ")
	public String cLecQ() {
		return "main/creator/cLecQ";
	}
	
	@GetMapping("/user/userLNL")
	public String userLecNoticeList(Model model) {
		model.addAttribute("notices",noticeDao.NoticeList());
		return "main/user/userLNL";
	}
	@GetMapping("/user/userLNS")
	public String userLecNoticeSelect(int ntNo, Model model) {
		model.addAttribute("notice",noticeDao.NoticeSelect(ntNo));
		return "main/user/userLNS";
	}
}
