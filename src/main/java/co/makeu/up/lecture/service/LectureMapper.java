package co.makeu.up.lecture.service;

import java.util.List;

import co.makeu.up.report.service.ReportVO;

public interface LectureMapper {
	int lectureInsert(LectureVO vo);
	LectureVO lectureSelect(int ltNo);
	List<LectureVO> requestLecture(LectureVO vo);
	List<LectureVO> openLecture(LectureVO vo);
	List<LectureVO> closeLecture(LectureVO vo);
	List<LectureVO> reportLecture(LectureVO vo);
	int lectureUpdate(LectureVO vo);
	int lectureReResister(LectureVO vo);
	int lectureReportCheck(LectureVO vo);
	List<ReportVO> reportLesson(ReportVO vo);
	int lectureReInsert(LectureVO vo);

	LectureVO lectureInsertTemp(LectureVO vo);
	int lectureUpdateTemp(LectureVO vo);
	List<LectureVO> creLectureList(String id);
	List<LectureVO> adminLectureList(LectureVO vo);
	List<LectureVO> adminLectureListPlus(LectureVO vo);

	List<LectureVO> adminLectureTable(LectureVO vo);
	LectureVO AdminlectureSelect(LectureVO vo);
	int AdminlectureUpdateOK(LectureVO vo);
	int AdminlectureUpdateReject(LectureVO vo);

    LectureVO adminLectureInfo(int ltNo);
}
