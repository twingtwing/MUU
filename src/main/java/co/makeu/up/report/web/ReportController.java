package co.makeu.up.report.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.report.service.ReportServiceImpl;
import co.makeu.up.report.service.ReportVO;

@Controller
public class ReportController {
	@Autowired ReportServiceImpl reportDao;	
  
	//강의 신고 리스트
	@GetMapping("/admin/adLRepL")
	public String adLRepL() {
		return "admin/report/adLRepL";
	}
	
	//강의 신고 상세
	@GetMapping("/admin/adLRepS")
	public String adLRepS() {
		return "admin/report/adLRepS";
	}
		
	//리뷰 신고 리스트
	@GetMapping("/admin/adRRepL")
	public String adRRepL() {
		return "admin/report/adRRepL";
	}
		
	//리뷰 신고 상세
	@GetMapping("/admin/adRRepS")
	public String adRRepS() {
		return "admin/report/adRRepS";
	}
	
	//신고 모달창
	@PostMapping("/user/reportReview")
	@ResponseBody
	public void reportReview(Principal pri, ReportVO vo) {
		vo.setReporter(pri.getName());
		reportDao.insertReviewReport(vo);
	}
	
	//강의 신고모달창
	@ResponseBody
	@PostMapping("/user/insertLecReport")
	public void insertLecReport(Principal pri, ReportVO vo) {
		vo.setReporter(pri.getName());
		reportDao.insertLecReport(vo);
	}

}
