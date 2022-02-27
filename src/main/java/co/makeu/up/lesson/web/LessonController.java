package co.makeu.up.lesson.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;

@Controller
public class LessonController {
	Logger logger = LoggerFactory.getLogger(LessonController.class);
	@Autowired LessonServiceImpl lessonDao;
	
	@PostMapping("/user/userLW")
	public String userLessonWatch(int ltNo, Model model) {
		model.addAttribute("firstLesson",lessonDao.lessonList(ltNo).get(0));
		model.addAttribute("lessons",lessonDao.lessonList(ltNo));
		return "main/user/userLW";
	}
	
	@ResponseBody
	@GetMapping("/user/userLWselect")
	public LessonVO userLWselect(int lsnNo, LessonVO vo) {
		vo = lessonDao.ajaxLessonSelect(lsnNo);
		return vo;
	}
}
