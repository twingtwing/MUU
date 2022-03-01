package co.makeu.up.lecture.service;

import java.util.List;

public interface LectureMapper {
	int lectureInsert(LectureVO vo);
	LectureVO lectureSelect(int ltNo);
	List<LectureVO> requestLecture(LectureVO vo);
	List<LectureVO> openLecture(LectureVO vo);
	List<LectureVO> closeLecture(LectureVO vo);
	List<LectureVO> reportLecture(LectureVO vo);
}
