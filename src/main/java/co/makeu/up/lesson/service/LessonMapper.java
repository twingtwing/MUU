package co.makeu.up.lesson.service;

import java.util.List;

public interface LessonMapper {
	List<LessonVO> lessonList(int ltNo);
	LessonVO ajaxLessonSelect(int lsnNo);
	List<LessonVO> lessonWithProgress(LessonVO vo);
}
