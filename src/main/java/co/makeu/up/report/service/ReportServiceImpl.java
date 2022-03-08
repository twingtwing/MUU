package co.makeu.up.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.extendedLecture.service.ExtendedLetureMapper;

@Repository("reportDao")
public class ReportServiceImpl implements ReportMapper{
	@Autowired ReportMapper map;
	@Autowired ExtendedLetureMapper mapper;
	
	@Override
	public int insertReviewReport(ReportVO vo) {
		return map.insertReviewReport(vo);
	}

	@Override
	public int insertLecReport(ReportVO vo) {
		return map.insertLecReport(vo);
	}

	@Override
	public List<ReportVO> selectreport(ReportVO vo) {
		return map.selectreport(vo);
	}

	@Override
	public ReportVO selectreports(ReportVO vo) {
		return map.selectreports(vo);
	}

	@Override
	public List<ReportVO> reportLectureList(String creid) {
		return map.reportLectureList(creid);
	}

	@Override
	public ReportVO selectrespss(ReportVO vo) {
		return map.selectrespss(vo);
	}

	@Override
	public int upreport(ReportVO vo) {
		return map.upreport(vo);
	}

	@Override
	public int uprepor(ReportVO vo) {
		return map.uprepor(vo);
	}

	@Override
	public int rerepor(ReportVO vo) {
		return map.rerepor(vo);
	}

	@Override
	public int upcode(ReportVO vo) {
		return map.upcode(vo);
	}

	@Override
	public int succode(ReportVO vo) {
		return map.succode(vo);
	}

	
	
}
