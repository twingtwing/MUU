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

	
	
}
