package co.makeu.up.review.web;

import java.security.Principal;
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

import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.review.service.ReviewServiceImpl;
import co.makeu.up.review.service.ReviewVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class ReviewController {
	@Autowired ReviewServiceImpl reviewDao;
	@Autowired SugangServiceImpl sugangDao;
	@Autowired ProgressServiceImpl progressDao;
	Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@GetMapping("/user/userLR")
	public String userLecReview(ReviewVO vo, Model model, SugangVO sugangvo, Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","잘못된 접근입니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
		}	
		sugangvo.setId(pri.getName());
		sugangvo.setLtNo(vo.getLtNo());
		sugangvo = sugangDao.sugangCheckDate(sugangvo);
		if(Objects.isNull(sugangvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","잘못된 접근입니다.");
			return "redirect:/accessError";
		}
		
		List<ReviewVO> list = reviewDao.reviewSelectList(vo);
		double avg = 0;
		for(ReviewVO rv : list) {
			avg = avg + rv.getStar();
		}
		avg = Math.round(avg/list.size());
		model.addAttribute("starAvg",avg);
		model.addAttribute("reviews",list);
		model.addAttribute("ltNo",vo.getLtNo());
		return "main/user/userLR";
	}
	
	@ResponseBody
	@PostMapping("/user/userLRWrite")
	public String userinsertReview(ReviewVO vo, Principal pri) {
		vo.setWriter(pri.getName());
		reviewDao.reviewInsert(vo);
		return "ok";
	}
}
