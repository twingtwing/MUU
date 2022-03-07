package co.makeu.up.report.service;

import java.util.List;

public interface ReportMapper {
	int insertReviewReport(ReportVO vo);
	int insertLecReport(ReportVO vo);
	List <ReportVO> selectreport( ReportVO vo);
	ReportVO selectreports(ReportVO vo);
	List<ReportVO> reportLectureList(String creid);
}
