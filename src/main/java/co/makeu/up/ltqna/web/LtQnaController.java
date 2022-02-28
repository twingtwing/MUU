package co.makeu.up.ltqna.web;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.ltqna.service.LtQnaServiceImpl;
import co.makeu.up.ltqna.service.LtQnaVO;

@Controller
public class LtQnaController {
	Logger logger = LoggerFactory.getLogger(LtQnaController.class);
	@Autowired LtQnaServiceImpl ltqnaDao;
	
	@GetMapping("/user/userLQ")
	public String userLecQuestion(LtQnaVO vo ,Model model, Principal pri) {
		vo.setPage(0);
		vo.setWriter(pri.getName());
		List<LtQnaVO> mylist = ltqnaDao.selectMyQnaList(vo);
		List<LtQnaVO> list = ltqnaDao.selectQnaList(vo);
		Pagination pagination = new Pagination(ltqnaDao.qnaListCnt(vo.getLtNo()),1);
		model.addAttribute("pagination",pagination);
		model.addAttribute("myList",mylist);
		model.addAttribute("qnaList",list);
		model.addAttribute("ltNo",vo.getLtNo());
		return "main/user/userLQ";
	}
	
	@GetMapping("/user/userLQpage")
	@ResponseBody
	public List<LtQnaVO> userLQpage(LtQnaVO vo){
		return ltqnaDao.selectQnaList(vo);
	}
	
	@GetMapping(value="/user/selectQna", produces="application/text;charset=utf8")
	@ResponseBody
	public String selectQna(int qnaNo) {
		logger.info(ltqnaDao.selectQna(qnaNo).getaContent());
		return ltqnaDao.selectQna(qnaNo).getaContent();
	}
	
	@PostMapping("/user/userInsertLQ")
	@ResponseBody
	public void userInsertLQ(LtQnaVO vo, Principal pri) {
		vo.setWriter(pri.getName());
		ltqnaDao.insertQna(vo);
	}
}
