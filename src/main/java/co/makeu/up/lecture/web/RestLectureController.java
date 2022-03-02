package co.makeu.up.lecture.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.makeu.up.extendedLecture.service.ExtendedLectureVO;
import co.makeu.up.extendedLecture.service.ExtendedLetureService;

@RestController
public class RestLectureController {
	@Autowired ExtendedLetureService extendedDao;
	
	//강의 검색 
	@RequestMapping(value = "/lectureList", method=RequestMethod.GET)
	public ExtendedLectureVO lectureList(ExtendedLectureVO vo){
		return extendedDao.extendedList(vo);
	}
	
	//강의 상세

}
