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

	@Override
	public ExtendedLectureVO extendedLecture(ExtendedLectureVO vo) {
		vo.setLectureDetail(map.lectureDetail(vo));
		vo.setLessonList(map.lessonList(vo));
		vo.setReviewList(map.reviewList(vo));
		vo.setLtQnaList(map.ltQnaList(vo));
		vo.setCtgrList(map.ctgrDetail(vo.getLectureDetail().getDownCtgr()));
		return vo;
	}
	
	@Override
	public ExtendedLectureVO extendedNotice(ExtendedLectureVO vo) {
		vo.setLectureDetail(map.lectureDetail(vo));
		vo.setCtgrList(map.ctgrDetail(vo.getLectureDetail().getDownCtgr()));
		vo.setNoticeList(map.noticeList(vo));
		return vo;
	}

	@Override
	public ExtendedLectureVO extendedCreator(ExtendedLectureVO vo) {
		vo = map.creatorDetail(vo);
		vo.setLectureList(map.lecList(vo));
		return vo;
	}

	@Override
	public ExtendedLectureVO extenedPay(ExtendedLectureVO vo) {
		vo.setUserAddr(map.userAddr(vo));
		vo.setLectureList(map.lecPay(vo));
		return vo;
	}
}
