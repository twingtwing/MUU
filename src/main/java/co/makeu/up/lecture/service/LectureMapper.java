package co.makeu.up.lecture.service;

public interface LectureMapper {
	int lectureInsert(LectureVO vo);
	LectureVO lectureSelect(int ltNo);
}
