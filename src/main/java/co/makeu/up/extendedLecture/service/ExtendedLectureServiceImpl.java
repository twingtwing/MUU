package co.makeu.up.extendedLecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("extendedDao")
public class ExtendedLectureServiceImpl implements ExtendedLetureService{
	
	@Autowired ExtendedLetureMapper map;

	@Override
	public ExtendedLectureVO extendedList(ExtendedLectureVO vo) {
		vo.setLectureList(map.lectureList(vo));
		vo.setCtgrList(map.ctgrList(vo));
		return vo;
	}

}
