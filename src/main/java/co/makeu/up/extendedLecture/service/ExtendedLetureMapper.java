package co.makeu.up.extendedLecture.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.makeu.up.ctgr.service.CtgrVO;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.ltqna.service.LtQnaVO;
import co.makeu.up.notice.service.NoticeVO;
import co.makeu.up.review.service.ReviewVO;
import co.makeu.up.users.service.UsersVO;

public interface ExtendedLetureMapper {
	
	ExtendedLectureVO creatorDetail(ExtendedLectureVO vo);
	
	UsersVO userAddr(ExtendedLectureVO vo);
	
	LectureVO lectureDetail(ExtendedLectureVO vo);
	List<LectureVO> lectureList(ExtendedLectureVO vo);
	List<LectureVO> lecList(ExtendedLectureVO vo);
	LectureVO lecPay(ExtendedLectureVO vo);
	
	List<CtgrVO> ctgrList(ExtendedLectureVO vo);
	List<CtgrVO> ctgrDetail(@Param("downCtgr") String downCtgr);
	
	List<LessonVO> lessonList(ExtendedLectureVO vo);
	
	List<ReviewVO> reviewList(ExtendedLectureVO vo);
	
	List<LtQnaVO> ltQnaList(ExtendedLectureVO vo);
	
	List<NoticeVO> noticeList(ExtendedLectureVO vo);
	
	//for main
	List<LectureVO> thisWeekLecture(ExtendedLectureVO vo);
	String bestCtgr(String time);
	List<LectureVO> bestCtgrLecture(ExtendedLectureVO vo);
	List<LectureVO> newLecture(ExtendedLectureVO vo);
	List<LectureVO> popularLecture(String time);
	List<LectureVO> randomLecture();
	
}
