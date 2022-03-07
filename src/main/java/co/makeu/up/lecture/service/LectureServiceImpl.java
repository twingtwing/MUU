package co.makeu.up.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<LectureVO> creLectureList(String id) {
		return map.creLectureList(id);
	}

}
