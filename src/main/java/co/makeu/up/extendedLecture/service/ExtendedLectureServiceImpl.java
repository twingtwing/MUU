package co.makeu.up.extendedLecture.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.makeu.up.lecture.service.LectureVO;

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
		vo.setLectureDetail(map.lecPay(vo));
		return vo;
	}

	@Override
	public ExtendedLectureVO extendHome(ExtendedLectureVO vo) {
		
		vo.setThisWeekLecture(map.thisWeekLecture(vo)); //이번주 베스트
		
		String week = map.bestCtgr("week");
		vo.setUpCtgr(week);
		List<LectureVO> weekList = map.bestCtgrLecture(vo);
		Collections.shuffle(weekList);
		if(weekList.size() > 6) {
			weekList = weekList.subList(0, 6);
		}
		vo.setBestCtgrLectureWeek(weekList); //저번주 베스트 카테고리
		
		String month = map.bestCtgr("month");
		vo.setUpCtgr(month);
		List<LectureVO> monthList = map.bestCtgrLecture(vo);
		if(monthList.size() > 6) {
			monthList = monthList.subList(0, 6);
		}
		Collections.shuffle(monthList);
		vo.setBestCtgrLectureMonth(monthList); //저번달 베스트 카테고리
		
		vo.setNewLecture(map.newLecture(vo)); //new 강의
		
		vo.setPopularLectureDay(map.popularLecture("day"));
		vo.setPopularLectureMonth(map.popularLecture("week"));
		vo.setPopularLectureMonth(map.popularLecture("month"));//인기 강의
		
		return vo;
	}

	@Override
	public List<LectureVO> randomLecture() {
		return map.randomLecture();
	}
}
