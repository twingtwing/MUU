package co.makeu.up.lesson.service;

import java.util.List;

public interface LessonMapper {
	List<LessonVO> lessonList(int ltNo);
	LessonVO ajaxLessonSelect(int lsnNo);
	int lessonInsert(LessonVO vo);
	List<LessonVO> lessonWithProgress(LessonVO vo);
	int lessonUpdate(List<LessonVO> list);
	LessonVO LessonOTselect(int ltNo);
	
}
