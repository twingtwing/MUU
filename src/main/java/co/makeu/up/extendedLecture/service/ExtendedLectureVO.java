package co.makeu.up.extendedLecture.service;

import java.util.List;

import co.makeu.up.ctgr.service.CtgrVO;
import co.makeu.up.lecture.service.LectureVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExtendedLectureVO {

	private String upCtgr;
	private String downCtgr;
	
	List<LectureVO> lectureList;
	List<CtgrVO> ctgrList;
}
