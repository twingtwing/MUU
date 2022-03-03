package co.makeu.up.extendedLecture.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.makeu.up.ctgr.service.CtgrVO;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.ltqna.service.LtQnaVO;
import co.makeu.up.review.service.ReviewVO;

public interface ExtendedLetureMapper {
	
	LectureVO lectureDetail(ExtendedLectureVO vo);
	List<LectureVO> lectureList(ExtendedLectureVO vo);
	List<CtgrVO> ctgrList(ExtendedLectureVO vo);
	List<CtgrVO> ctgrDetail(@Param("downCtgr") String downCtgr);
	List<LessonVO> lessonList(ExtendedLectureVO vo);
	List<ReviewVO> reviewList(ExtendedLectureVO vo);
	List<LtQnaVO> ltQnaList(ExtendedLectureVO vo);
}
