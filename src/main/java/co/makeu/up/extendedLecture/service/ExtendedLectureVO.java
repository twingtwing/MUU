package co.makeu.up.extendedLecture.service;

import java.util.List;

import co.makeu.up.ctgr.service.CtgrVO;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.ltqna.service.LtQnaVO;
import co.makeu.up.review.service.ReviewVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExtendedLectureVO {

	private String id;
	private String ltNo;
	private String upCtgr;
	private String downCtgr;
	
	private LectureVO lectureDetail;//강의 단건
	private List<LectureVO> lectureList;//강의 리스트
	private List<CtgrVO> ctgrList;//카테고리 리스트
	private List<LessonVO> lessonList;//수업 리스트
	private List<ReviewVO> reviewList;//후기 리스트
	private List<LtQnaVO> ltQnaList;//질문리스트
}
