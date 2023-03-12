package co.makeu.up.progress.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;

@Controller
public class ProgressController {
	@Autowired ProgressServiceImpl progressDao;
	
	@PostMapping("/user/progressUpdate")
	@ResponseBody
	public String progressUpdate(ProgressVO vo, Principal pri) {
		vo.setId(pri.getName());
		ProgressVO existingPrg = new ProgressVO();
		existingPrg = progressDao.selectProgress(vo);
		if(existingPrg==null) {
			progressDao.insertProgress(vo);
			return "없음 ㅇㅅㅇ";
		}
		if(existingPrg.getProgPct()>=vo.getProgPct()) {
			return "기존 진도율이 더 큼 ㅇㅅㅇ";
		} else if(progressDao.updateProgress(vo)!=0) {
			return "업데이트 완료";
		} else {
			return "실패 ㅇㅅㅇ";
		}
	}
}
