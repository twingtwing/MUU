package co.makeu.up.ltqna.web;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class LtQnaController {
	Logger logger = LoggerFactory.getLogger(LtQnaController.class);
	@Autowired LtQnaServiceImpl ltqnaDao;
	@Autowired SugangServiceImpl sugangDao;
	@Autowired ProgressServiceImpl progressDao;
	
	@GetMapping("/user/userLQ")
	public String userLecQuestion(LtQnaVO vo ,Model model, Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","사용자가 잘못된 방식으로 만료된 강의에 접근하려고 합니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
		}	
		
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
	public LtQnaVO userInsertLQ(LtQnaVO vo, Principal pri) {
		vo.setWriter(pri.getName());
		ltqnaDao.insertQna(vo);
		return vo;
	}
}
