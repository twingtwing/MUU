package co.makeu.up.lecture.service;

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

}
