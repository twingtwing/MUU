package co.makeu.up.lesson.web;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;

@Controller
public class LessonController {
	Logger logger = LoggerFactory.getLogger(LessonController.class);
	@Autowired LessonServiceImpl lessonDao;
	@Autowired ProgressServiceImpl progressDao;
	@PostMapping("/user/userLW")
	public String userLessonWatch(LessonVO vo, Model model, Principal pri) {
		vo.setId(pri.getName());
		model.addAttribute("firstLesson",lessonDao.ajaxLessonSelect(vo.getLsnNo()));
		model.addAttribute("lessons",lessonDao.lessonList(vo.getLtNo()));
		
		ProgressVO progressvo = new ProgressVO();
		progressvo.setId(pri.getName());
		progressvo.setLsnNo(vo.getLsnNo());
		progressvo = progressDao.selectProgress(progressvo);
		if(progressvo==null) {
			logger.info("null값입니다! ");
			ProgressVO pgrvo = new ProgressVO();
			pgrvo.setId(pri.getName());
			pgrvo.setLsnNo(vo.getLsnNo());
			pgrvo.setProgPct(0);
			progressDao.insertProgress(pgrvo);
		}
		return "main/user/userLW";
	}
	
	// 수업 누르면 영상바뀌게
	@ResponseBody
	@GetMapping("/user/userLWselect")
	public LessonVO userLWselect(int lsnNo, LessonVO vo, Principal pri) {
		ProgressVO progressvo = new ProgressVO();
		progressvo.setId(pri.getName());
		progressvo.setLsnNo(vo.getLsnNo());
		progressvo = progressDao.selectProgress(progressvo);
		System.out.println(progressvo);
		if(progressvo==null) {
			ProgressVO pgrvo = new ProgressVO();
			pgrvo.setId(pri.getName());
			pgrvo.setLsnNo(vo.getLsnNo());
			pgrvo.setProgPct(0);
			progressDao.insertProgress(pgrvo);
		}	
		vo = lessonDao.ajaxLessonSelect(lsnNo);
		return vo;
	}
	
	//수업 영상 관리 페이지
	@RequestMapping("/creator/lesU")
	public String lessonUpdatePage(int sendltno, Model model) {
		model.addAttribute("lesinfo", lessonDao.lessonList(sendltno));
		return "main/lecture/lesU";
	}

}
