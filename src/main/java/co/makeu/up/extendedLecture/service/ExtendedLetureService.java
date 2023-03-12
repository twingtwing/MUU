package co.makeu.up.extendedLecture.service;

import java.util.List;

import co.makeu.up.lecture.service.LectureVO;

public interface ExtendedLetureService {
	
	ExtendedLectureVO extendedList(ExtendedLectureVO vo);
	
	ExtendedLectureVO extendedLecture(ExtendedLectureVO vo);
	
	ExtendedLectureVO extendedNotice(ExtendedLectureVO vo);

	ExtendedLectureVO extendedCreator(ExtendedLectureVO vo);
	
	ExtendedLectureVO extenedPay(ExtendedLectureVO vo);
	
	ExtendedLectureVO extendHome(ExtendedLectureVO vo);
	
	List<LectureVO> randomLecture();
}
