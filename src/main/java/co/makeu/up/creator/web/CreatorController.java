package co.makeu.up.creator.web;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.creator.service.CreatorServiceImpl;
import co.makeu.up.creator.service.CreatorVO;
import co.makeu.up.sales.service.SalesVO;

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
			model.addAttribute("photo", vo.getPht());
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
			model.addAttribute("photo", vo.getPht());
		return "main/creator/creU";
	}
	
	//크리에이터 정보 수정
	@PostMapping("/creator/creU")
	@ResponseBody
	public void creatorUpdate(CreatorVO vo, Model model, HttpServletRequest request) {
			creatorDao.creatorUpdate(vo);
	}
	
	@GetMapping("/creator/creLectureReview")
	public String creLectureReview() {
		return "main/creator/cLecR";
	}
	
	//크리에이터 매출
	@GetMapping("/creator/creSaleYear")
	public String creSalesYear(Model model,Principal pri) {
		model.addAttribute("years",creatorDao.creSaYear(pri.getName()));
		return "main/creator/creSaYear";
	}
	
	@GetMapping("/creator/creSaleMonth")
	public String creSalesMonth(Model model,Principal pri,SalesVO vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Calendar c1 = Calendar.getInstance();
		model.addAttribute("thisyear",sdf.format(c1.getTime()));
		
		vo.setId(pri.getName());
		vo.setSelectYear(sdf.format(c1.getTime()));
		model.addAttribute("months",creatorDao.creSalesMonth(vo));
		return "main/creator/creSaMonth";
	}
	
	@ResponseBody
	@GetMapping("/creator/creSaleMonth/ajaxMonth")
	public List<SalesVO> ajaxMonth(SalesVO vo, Principal pri){
		vo.setId(pri.getName());
		return creatorDao.creSalesMonth(vo);
	}
	
	@GetMapping("/creator/creSaleLec")
	public String creSaleLec(Model model,SalesVO vo, Principal pri) {
		vo.setId(pri.getName());
		model.addAttribute("lecs",creatorDao.creSaleLec(vo));
		return "main/creator/creSaLec";
	}
	
	@ResponseBody
	@GetMapping("/creator/creSaleLec/ajaxLec")
	public List<SalesVO> ajaxLec(SalesVO vo,Principal pri){
		vo.setId(pri.getName());
		return creatorDao.creSaleLec(vo);
	}
	
	//강의상세-크리에이터정보
	@GetMapping("/creD")
	public String creD(@RequestParam("creId") String id, Model model) {
		model.addAttribute("id",id);
		return "main/creator/creD";
	}
	
}
