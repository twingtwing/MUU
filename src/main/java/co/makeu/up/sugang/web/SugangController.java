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
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class SugangController {
	private final Logger logger = LoggerFactory.getLogger(SugangController.class.getName());
	@Autowired SugangServiceImpl sugangDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired LessonServiceImpl lessonDao;
	
	@GetMapping("/user/userLectureList")
	public String mySugangList(Principal pri, Model model) {
		List<SugangVO> sugangOn = new ArrayList<SugangVO>();
		List<SugangVO> sugangOff = new ArrayList<SugangVO>();
		for(SugangVO sugang : sugangDao.sugangSelectList(pri.getName())) {
			if(sugang.getTlsnStCode().equals("SU01")) {
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
	public String userLectureSelect(SugangVO vo, Model model) {
		SugangVO checkvo = new SugangVO();
		checkvo = sugangDao.sugangCheckDate(vo);
		logger.info(checkvo.getTtl());
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","사용자가 잘못된 방식으로 만료된 강의에 접근하려고 합니다.");
			return "redirect:/accessError";
		} else {
			// progress 상태도 함께 넘겨야함 (list)
			model.addAttribute("sugang",checkvo);
			model.addAttribute("lessonList",lessonDao.lessonList(vo.getLtNo()));
			return "main/user/userLS";
		}
	}
}
