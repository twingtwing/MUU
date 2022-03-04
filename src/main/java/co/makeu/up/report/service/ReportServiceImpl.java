package co.makeu.up.report.service;

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

}
