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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
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
	@Autowired LectureServiceImpl lectureDao;
	
	//공지사항 리스트 페이지
	@RequestMapping("/creator/cLecNL")
	public String cLecNL(LectureVO lvo, NoticeVO nvo, Model model) {
		nvo.setPage(1);
		List<NoticeVO> nlists = noticeDao.NoticeList(nvo);
		int listCnt = nlists.get(0).getCount();
		Pagination pagination = new Pagination(listCnt, 1);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("nlists", nlists);
		return "main/lecture/cLecNL";
	}
	//공지사항 리스트 페이지(번호클릭시)
	@RequestMapping("/creator/cLecNLpage")
	public String cLecNLpage(LectureVO lvo, NoticeVO nvo, Model model, HttpServletRequest request) {
		List<NoticeVO> nlists = noticeDao.NoticeList(nvo);
		int listCnt = nlists.get(0).getCount();
		Pagination pagination = new Pagination(listCnt, 1);
		pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("nlists", nlists);
		return "main/lecture/cLecNL";
	}
	
	//공지사항 한건 읽기
	@GetMapping("/creator/cLecNS")
	public String cLecNS(LectureVO lvo, NoticeVO nvo, Model model) {
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("noinfo", noticeDao.NoticeSelect(nvo));
		noticeDao.updateHits(nvo);
		return "main/lecture/cLecNS";
	}
	//공지사항 수정
	
	//공지사항 삭제
	@RequestMapping("/creator/cLecNdelete")
	public String cLecNdelete(NoticeVO vo, Model model) {
		noticeDao.deleteNotice(vo);
		return "redirect:/lecture/cLecNL";
	}
	
	//공지사항 글 등록 페이지
	@GetMapping("/creator/cLecNI")
	public String cLecNI(LectureVO vo, Model model, HttpServletRequest request) {
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		return "main/lecture/cLecNI";
	}
	
	//공지사항 글 insert
	@PostMapping("/creator/cLecNInsert")
	@ResponseBody
	public void cLecNInsert(NoticeVO vo) {
		noticeDao.insertNotice(vo);
	}
	
	@GetMapping("/creator/cLecNU")
	public String cLecNU() {
		return "main/lecture/cLecNU";
	}
	@GetMapping("/creator/cLecQ")
	public String cLecQ() {
		return "main/lecture/cLecQ";
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
		vo.setPage(1);
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
		noticeDao.updateHits(vo);
		model.addAttribute("noticeFiles",noticeDao.noticeFiles(vo.getLtNo()));
		return "main/user/userLNS";
	}
}
