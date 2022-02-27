package co.makeu.up.lesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lessonDao")
public class LessonServiceImpl implements LessonMapper {
	@Autowired LessonMapper map;
	
	@Override
	public List<LessonVO> lessonList(int ltNo) {
		return map.lessonList(ltNo);
	}

	@Override
	public LessonVO ajaxLessonSelect(int lsnNo) {
		return map.ajaxLessonSelect(lsnNo);
	}

}
