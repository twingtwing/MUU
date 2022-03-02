package co.makeu.up.report.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.report.service.ReportServiceImpl;
import co.makeu.up.report.service.ReportVO;

@Controller
public class ReportController {
	@Autowired ReportServiceImpl reportDao;
	
	@PostMapping("/user/reportReview")
	@ResponseBody
	public void reportReview(Principal pri, ReportVO vo) {
		vo.setReporter(pri.getName());
		reportDao.insertReviewReport(vo);
	}
}
