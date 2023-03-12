package co.makeu.up.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.report.service.ReportVO;

@Repository("lectureDao")
public class LectureServiceImpl implements LectureMapper {

	@Autowired
	LectureMapper map;
	
	@Override
	public int lectureInsert(LectureVO vo) {
		return map.lectureInsert(vo);
	}

	@Override
	public LectureVO lectureSelect(int ltNo) {
		return map.lectureSelect(ltNo);
	}

	@Override
	public List<LectureVO> requestLecture(LectureVO vo) {
		return map.requestLecture(vo);
	}

	@Override
	public List<LectureVO> openLecture(LectureVO vo) {
		return map.openLecture(vo);
	}

	@Override
	public List<LectureVO> closeLecture(LectureVO vo) {
		return map.closeLecture(vo);
	}

	@Override
	public List<LectureVO> reportLecture(LectureVO vo) {
		return map.reportLecture(vo);
	}

	@Override
	public int lectureUpdate(LectureVO vo) {
		return map.lectureUpdate(vo);
	}

	@Override
	public LectureVO lectureInsertTemp(LectureVO vo) {
		return map.lectureInsertTemp(vo);
	}

	@Override
	public int lectureUpdateTemp(LectureVO vo) {
		return map.lectureUpdateTemp(vo);
	}
	@Override
	public List<LectureVO> creLectureList(String id) {
		return map.creLectureList(id);
	}
	
	//관리자 강의관리 관련입니다.
	@Override
	public List<LectureVO> adminLectureList(LectureVO vo) {
		return map.adminLectureList(vo);
	}

	@Override
	public List<LectureVO> adminLectureTable(LectureVO vo) {
		return map.adminLectureTable(vo);
	}

	@Override
	public LectureVO AdminlectureSelect(LectureVO vo) {
		return map.AdminlectureSelect(vo);
	}

	@Override
	public int AdminlectureUpdateOK(LectureVO vo) {
		return map.AdminlectureUpdateOK(vo);
	}

	@Override
	public int AdminlectureUpdateReject(LectureVO vo) {
		return map.AdminlectureUpdateReject(vo);
	}

	@Override
	public LectureVO adminLectureInfo(int ltNo) {
		return map.adminLectureInfo(ltNo);
	}

	@Override
	public List<LectureVO> adminLectureListPlus(LectureVO vo) {
		return map.adminLectureListPlus(vo);
	}

	@Override
	public int lectureReResister(LectureVO vo) {
		return map.lectureReResister(vo);
	}

	@Override
	public int lectureReportCheck(LectureVO vo) {
		return map.lectureReportCheck(vo);
	}

	@Override
	public List<ReportVO> reportLesson(ReportVO vo) {
		return map.reportLesson(vo);
	}

	@Override
	public int lectureReInsert(LectureVO vo) {
		return map.lectureReInsert(vo);
	}

	@Override
	public int lectureDelete(LectureVO vo) {
		return map.lectureDelete(vo);
	}

	@Override
	public LectureVO lectureTempSelect(LectureVO vo) {
		return map.lectureTempSelect(vo);
	}

}
