package co.makeu.up.report.web;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.PageVo;
import co.makeu.up.report.service.ReportServiceImpl;
import co.makeu.up.report.service.ReportVO;

@Controller
public class ReportController {
	@Autowired ReportServiceImpl reportDao;	
  
	//강의 신고 리스트
	@GetMapping("/admin/adLRepL")
	public String adLRepL(ReportVO vo , Model model) {
		List <ReportVO> list = reportDao.selectreport(vo);
		model.addAttribute("list",list);
		int length = 0;
		if(list.size() != 0) {
			length = list.get(0).getLength();
		}
		model.addAttribute("pageMaker",new PageVo(vo,length));
		System.out.println(model.getAttribute("pageMaker"));
		return "admin/report/adLRepL";
	}
	
	//강의 신고 상세
	@GetMapping("/admin/adLRepS")
	public String adLRepS(ReportVO vo , Model model) {
		model.addAttribute("report",reportDao.selectreports(vo));
		return "admin/report/adLRepS";
	}
		
	//리뷰 신고 리스트
	@GetMapping("/admin/adRRepL")
	public String adRRepL(ReportVO vo , Model model) {
		List <ReportVO> list = reportDao.selectreport(vo);
		model.addAttribute("list",list);
		int length = 0;
		if(list.size() != 0) {
			length = list.get(0).getLength();
		}
		model.addAttribute("pageMaker",new PageVo(vo,length));
		System.out.println(model.getAttribute("pageMaker"));
		return "admin/report/adRRepL";
	}
		
	//리뷰 신고 상세
	@GetMapping("/admin/adRRepS")
	public String adRRepS(ReportVO vo , Model model) {
		model.addAttribute("report",reportDao.selectreports(vo));
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
