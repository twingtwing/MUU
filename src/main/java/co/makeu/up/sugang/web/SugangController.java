package co.makeu.up.sugang.web;

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

import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class SugangController {
	private final Logger logger = LoggerFactory.getLogger(SugangController.class.getName());
	@Autowired SugangServiceImpl sugangDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired LessonServiceImpl lessonDao;
	@Autowired ProgressServiceImpl progressDao;
	
	@GetMapping("/user/userLectureList")
	public String mySugangList(Principal pri, Model model) {
		List<SugangVO> sugangOn = new ArrayList<SugangVO>();
		List<SugangVO> sugangOff = new ArrayList<SugangVO>();
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		for(SugangVO sugang : sugangDao.sugangSelectList(pri.getName())) {
			if(sugang.getTlsnStCode().equals("SU01")) {
				prvo.setLtNo(sugang.getLtNo());
				sugang.setProgPct(progressDao.wholeProgress(prvo));
				sugangOn.add(sugang);
			} else {
				sugangOff.add(sugang);
			}
		}
		// progress 상태도 list에 담아서 넘기자
		model.addAttribute("sugangList",sugangOn);
		model.addAttribute("sugangEndList",sugangOff);
		return "main/user/userLL";
	}
	
	@PostMapping("/user/userLectureSelect")
	public String userLectureSelect(SugangVO vo, Model model,LessonVO lessonvo, Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		vo.setId(pri.getName());
		checkvo = sugangDao.sugangCheckDate(vo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","잘못된 접근입니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			lessonvo.setId(vo.getId());
			lessonvo.setLtNo(vo.getLtNo());
			model.addAttribute("progress",lessonDao.lessonWithProgress(lessonvo));
			model.addAttribute("sugang",checkvo);
			model.addAttribute("lessonList",lessonDao.lessonList(vo.getLtNo()));
			return "main/user/userLS";
		}
	}
	
	@GetMapping("/user/userRefund")
	public String userRefund(SugangVO vo, Model model,Principal pri,LessonVO lessonvo) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);	
		// 7일이 지났거나 본 강의가 OT제외 3개를 초과할 때 접근 불가
		if(sugangDao.sugangBeforeRefund(checkvo)==0 || progressDao.countBeforeRefund(prvo)>3) {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			lessonvo.setId(pri.getName());
			lessonvo.setLtNo(vo.getLtNo());
			model.addAttribute("progress",lessonDao.lessonWithProgress(lessonvo));
			model.addAttribute("sugang",checkvo);
			model.addAttribute("lessonList",lessonDao.lessonList(vo.getLtNo()));
			model.addAttribute("msg","환불 정책에 어긋나여 환불할 수 없습니다.");
			return "main/user/userLS";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
			return "main/user/userR";			
		}
	}

}
