package co.makeu.up.extendedLecture.service;

import java.util.List;

import co.makeu.up.ctgr.service.CtgrVO;
import co.makeu.up.lecture.service.LectureVO;

public interface ExtendedLetureMapper {
	
	List<LectureVO> lectureList(ExtendedLectureVO vo);
	List<CtgrVO> ctgrList(ExtendedLectureVO vo);

}
