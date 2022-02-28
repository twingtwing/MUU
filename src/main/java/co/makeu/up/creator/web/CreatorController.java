package co.makeu.up.creator.web;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.creator.service.CreatorServiceImpl;
import co.makeu.up.creator.service.CreatorVO;

@Controller
public class CreatorController {
	@Autowired
	private CreatorServiceImpl creatorDao;
	
	//크리에이터 정보페이지 / 조회
	@GetMapping("/creator/creS")
	public String creatorPage(CreatorVO vo, Model model, Principal principal) {
			vo.setId(principal.getName());
			vo = creatorDao.creatorSelect(vo);
			model.addAttribute("name", vo.getName());
			model.addAttribute("creIntro", vo.getCreIntro());
//			model.addAttribute("creCode", vo.getCreGrdCode());
//			model.addAttribute("photo", vo.getPht());
		return "main/creator/creS";
	}
	
	
	//크리에이터 정보 수정 페이지
	@GetMapping("/creator/creUp")
	public String creatorUpdatePage(CreatorVO vo, Model model, Principal principal) {
			vo.setId(principal.getName());
			vo = creatorDao.creatorSelect(vo);
			model.addAttribute("id", vo.getId());
			model.addAttribute("name", vo.getName());
			model.addAttribute("creIntro", vo.getCreIntro());
//			model.addAttribute("creCode", vo.getCreGrdCode());
//			model.addAttribute("photo", vo.getPht());
		return "main/creator/creU";
	}
	
	//크리에이터 정보 수정
	@PostMapping("/creator/creU")
	@ResponseBody
	public void creatorUpdate(CreatorVO vo, Model model, HttpServletRequest request) {
			String id = request.getParameter("id");
			String creIntro = request.getParameter("creIntro");
			vo.setId(id);
			vo.setCreIntro(creIntro);
			creatorDao.creatorUpdate(vo);
	}
	
	@GetMapping("/creator/creLectureReview")
	public String creLectureReview() {
		return "main/creator/cLecR";
	}
	@GetMapping("/creator/creRefund")
	public String creRefund() {
		return "main/creator/creR";
	}
	@GetMapping("/creator/creSaleYear")
	public String creSalesYear() {
		return "main/creator/creSaYear";
	}
	@GetMapping("/creator/creSaleMonth")
	public String creSalesMonth() {
		return "main/creator/creSaMonth";
	}
	@GetMapping("/creator/creSaleLec")
	public String creSaleLec() {
		return "main/creator/creSaLec";
	}
	
	//강의상세-크리에이터정보
	@GetMapping("/creD")
	public String creD() {
		return "main/creator/creD";
	}
	
}
