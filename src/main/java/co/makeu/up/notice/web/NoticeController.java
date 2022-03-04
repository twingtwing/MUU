package co.makeu.up.notice.web;

import java.security.Principal;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.notice.service.NoticeServiceImpl;
import co.makeu.up.notice.service.NoticeVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class NoticeController {
	Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired NoticeServiceImpl noticeDao;
	@Autowired SugangServiceImpl sugangDao;
	@Autowired ProgressServiceImpl progressDao;
	
	@GetMapping("/creator/cLecNL")
	public String cLecNL(NoticeVO vo, Model model, HttpServletRequest request) {
//			model.addAttribute("nlists", noticeDao.NoticeList());
		return "main/creator/cLecNL";
	}
	@GetMapping("/creator/cLecNS")
	public String cLecNS() {
		return "main/creator/cLecNS";
	}
	
	@GetMapping("/creator/cLecNI")
	public String cLecNI() {
		return "main/creator/cLecNI";
	}
	@GetMapping("/creator/cLecNU")
	public String cLecNU() {
		return "main/creator/cLecNU";
	}
	@GetMapping("/creator/cLecQ")
	public String cLecQ() {
		return "main/creator/cLecQ";
	}
	
	// 공지 리스트
	@GetMapping("/user/userLNL")
	public String userLecNoticeList(NoticeVO vo, Model model, Principal pri){	
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","잘못된 접근입니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
		}		
		vo.setPage(0);
		int listCnt = noticeDao.NoticeListCnt(vo.getLtNo());
		Pagination pagination = new Pagination(listCnt,1);
		model.addAttribute("ltno",vo.getLtNo());
		model.addAttribute("notices",noticeDao.NoticeList(vo));
		model.addAttribute("pagination",pagination);
		return "main/user/userLNL";
	}
	
	// 페이지네이션
	@GetMapping("/user/userNoticePage")
	@ResponseBody
	public List<NoticeVO> userNoticePage(NoticeVO vo) {
		logger.info("ltno는"+vo.getLtNo()+"page는"+vo.getPage());	
		return noticeDao.NoticeList(vo);
	}
	
	@ResponseBody
	@GetMapping("/user/userNoticeSearch")
	public List<NoticeVO> userNoticeSearch(NoticeVO vo) {
		return noticeDao.NoticeList(vo);
	}
	
	// 공지사항 선택
	@GetMapping("/user/userLNS")
	public String userLecNoticeSelect(NoticeVO vo, Model model,Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		checkvo.setProgPct(progressDao.wholeProgress(prvo));
		model.addAttribute("sugang",checkvo);
		model.addAttribute("notice",noticeDao.NoticeSelect(vo));
		noticeDao.updateHits(vo.getNtNo());
		return "main/user/userLNS";
	}
}
