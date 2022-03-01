package co.makeu.up.qst.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.qst.service.QstServiceImpl;
import co.makeu.up.qst.service.QstVO;

@Controller
public class qstController {
	@Autowired QstServiceImpl qstDao;
	
	@GetMapping("/user/qna")
	public String qna() {
		return "main/all/qna";
	}
	
	@ResponseBody
	@PostMapping("/QstInsert")
	public String QstInsert(QstVO vo) {
		System.out.println("도착은 한거니?");
		System.out.println("아니 아직멀었어");
		System.out.println(vo.toString());
		qstDao.QstInsert(vo);
		return "main/all/qna";
	}
	
	//admin list
	@GetMapping("/admin/adQstL")
	public String adQstL() {
		return "admin/all/adQstL";
	}
	
	//admin select
	@GetMapping("/admin/adQstS")
	public String adQstS() {
		return "admin/all/adQstS";
	}
}
