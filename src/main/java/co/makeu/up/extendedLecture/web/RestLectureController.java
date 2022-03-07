package co.makeu.up.extendedLecture.web;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.makeu.up.extendedLecture.service.ExtendedLectureVO;
import co.makeu.up.extendedLecture.service.ExtendedLetureService;

@RestController
public class RestLectureController {
	@Autowired ExtendedLetureService extendedDao;
	
	//강의 검색 
	@RequestMapping(value = "/lectureList", method=RequestMethod.GET)
	public ExtendedLectureVO lectureList(ExtendedLectureVO vo,Principal pri){
		if(pri != null) {
			vo.setId(pri.getName());
		}
		return extendedDao.extendedList(vo);
	}
	
	//강의 상세
	@RequestMapping(value = "/lectureDetail",method=RequestMethod.GET)
	public ExtendedLectureVO lectureDetail(ExtendedLectureVO vo, Principal pri) {
		if(pri != null) {
			vo.setId(pri.getName());
		}
		return extendedDao.extendedLecture(vo);
	}
	
	//강의 상세 - 공지사항
	@RequestMapping(value = "/lectureNotice", method = RequestMethod.GET)
	public ExtendedLectureVO lectureNotice(ExtendedLectureVO vo) {
		return extendedDao.extendedNotice(vo);
	}
	
	//크리에이터 상세
	@RequestMapping(value = "/creDetail",method=RequestMethod.GET)
	public ExtendedLectureVO creDetail(ExtendedLectureVO vo, Principal pri) {
		if(pri != null) {
			vo.setId(pri.getName());
		}
		return extendedDao.extendedCreator(vo);
	}
	
	//결제
	@RequestMapping(value = "/user/lecturePay", method =RequestMethod.POST)
	public ExtendedLectureVO lecturePay0(ExtendedLectureVO vo,Principal pri) {
		vo.setId(pri.getName());
		return extendedDao.extenedPay(vo);
	}

}
