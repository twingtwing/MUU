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
		vo.setCtgr("RP02");
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
		model.addAttribute("report",reportDao.selectrespss(vo));
		return "admin/report/adLRepS";
	}
		
	//리뷰 신고 리스트
	@GetMapping("/admin/adRRepL")
	public String adRRepL(ReportVO vo , Model model) {
		vo.setCtgr("RP01");
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
	
	@ResponseBody
	@PostMapping("/admin/deladaRRepS")
	public String deladaRRepS(ReportVO vo) {
		int r = 0 ;
		r+=reportDao.uprepor(vo);
		r+=reportDao.upreport(vo);
		String result = "N";
		if(r==2) {
			result ="Y";
		}
		return result;
	}
	
	//신고 모달창
	@ResponseBody
	@PostMapping("/user/reportReview")
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
	
	@ResponseBody
	@PostMapping("/admin/rerepor")
	public String rerepor(ReportVO vo) {
		System.out.println("ffffff");
		int r = 0;
		r+= reportDao.rerepor(vo);
		String result ="N";
		if (r==1) {
			result ="t";
		}
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/admin/reupcode")
	public String reupcode(ReportVO vo) {
		System.out.println("ffffff");
		int r = 0;
		r+= reportDao.upcode(vo);
		String result ="N";
		if (r==1) {
			result ="A";
		}
		return result;
	}
		
	@ResponseBody
	@PostMapping("/admin/upcode")
	
	public String upcode(ReportVO vo) {
		System.out.println("ltno : " + vo.getLtNo());
		int r= 0;
		r+= reportDao.upreport(vo);
		r+= reportDao.upcode(vo);
		String result = "N";
		if( r == 2) {
			result = "Y";
		}
		return result ;
	}
	@ResponseBody
	@PostMapping("/admin/succode")
	public String succode(ReportVO vo) {
		int r =0;
		r+= reportDao.succode(vo);
		String result = "N";
		if(r ==1 ) {
			result = "S";
		}
		return result;
	}
	
	
	//크리에이터 리뷰 신고
	@PostMapping("/creator/cLecR")
	@ResponseBody
	public void cLecR(ReportVO vo) {
		reportDao.insertReviewReport(vo);
	}
	
}
