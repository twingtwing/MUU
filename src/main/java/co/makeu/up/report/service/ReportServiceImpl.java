package co.makeu.up.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.review.service.ReviewVO;

@Repository("reportDao")
public class ReportServiceImpl implements ReportMapper{
	@Autowired ReportMapper map;
	
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
		// TODO Auto-generated method stub
		return map.selectreport(vo);
	}

	@Override
	public ReportVO selectreports(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.selectreports(vo);
	}

	@Override
	public List<ReportVO> reportLectureList(String creid) {
		return map.reportLectureList(creid);
	}

	@Override
	public ReportVO selectrespss(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.selectrespss(vo);
	}

	@Override
	public int upreport(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.upreport(vo);
	}

	@Override
	public int uprepor(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.uprepor(vo);
	}

	@Override
	public int rerepor(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.rerepor(vo);
	}

	
	
}
