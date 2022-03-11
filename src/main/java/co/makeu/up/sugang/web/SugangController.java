package co.makeu.up.sugang.web;

import java.security.Principal;
import java.util.ArrayList;
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
import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class SugangController {
	private final Logger logger = LoggerFactory.getLogger(SugangController.class.getName());
	@Autowired SugangServiceImpl sugangDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired LessonServiceImpl lessonDao;
	@Autowired ProgressServiceImpl progressDao;
	@Autowired UsersServiceImpl userDao;
	
	@GetMapping("/user/userLectureList")
	public String mySugangList(Principal pri, Model model) {
		List<SugangVO> sugangOn = new ArrayList<SugangVO>();
		List<SugangVO> sugangOff = new ArrayList<SugangVO>();
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		for(SugangVO sugang : sugangDao.sugangSelectList(pri.getName())) {
			if(sugang.getTlsnStCode().equals("SU01")) {
				prvo.setLtNo(sugang.getLtNo());
				sugang.setProgPct(progressDao.wholeProgress(prvo));
				sugangOn.add(sugang);
			} else {
				sugangOff.add(sugang);
			}
		}
		model.addAttribute("listCnt",sugangOn.size());
		model.addAttribute("sugangList",sugangOn);
		model.addAttribute("sugangEndList",sugangOff);
		return "main/user/userLL";
	}
	
	@GetMapping("/user/userLectureSelect")
	public String userLectureSelect(SugangVO vo, Model model,LessonVO lessonvo, Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		vo.setId(pri.getName());
		checkvo = sugangDao.sugangCheckDate(vo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","잘못된 접근입니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			lessonvo.setId(vo.getId());
			lessonvo.setLtNo(vo.getLtNo());
			model.addAttribute("progress",lessonDao.lessonWithProgress(lessonvo));
			model.addAttribute("sugang",checkvo);
			model.addAttribute("lessonList",lessonDao.lessonList(vo.getLtNo()));
			return "main/user/userLS";
		}
	}
	
	@GetMapping("/user/userRefund")
	public String userRefund(SugangVO vo, Model model,Principal pri,LessonVO lessonvo) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);	
		// 7일이 지났거나 본 강의가 OT제외 3개를 초과할 때 접근 불가 + 구매확정시 불가 추가
		if(sugangDao.sugangBeforeRefund(checkvo)==0 || progressDao.countBeforeRefund(prvo)>3 || checkvo.getShipStCode().equals("D03")) {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			lessonvo.setId(pri.getName());
			lessonvo.setLtNo(vo.getLtNo());
			model.addAttribute("progress",lessonDao.lessonWithProgress(lessonvo));
			model.addAttribute("sugang",checkvo);
			model.addAttribute("lessonList",lessonDao.lessonList(vo.getLtNo()));
			model.addAttribute("msg","환불 정책에 어긋나여 환불할 수 없습니다.");
			return "main/user/userLS";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
			return "main/user/userR";			
		}
	}
	@GetMapping("/user/userPay")
	public String userPay(Principal pri, Model model, SugangVO vo){
		vo.setId(pri.getName());
		List<SugangVO> listDelivery = new ArrayList<SugangVO>();
		List<SugangVO> listAll = sugangDao.sugangPay(vo);
		if(listAll.size()!=0) {			
		for(SugangVO list : listAll) {
			if(list.getShipStCode()!=null && list.getShipNum()!=null && !list.getShipStCode().equals("D03")) {
				listDelivery.add(list);
			}
		}
		}
		model.addAttribute("payCnt",listAll.size());
		model.addAttribute("payInfo",listAll);
		model.addAttribute("delInfo",listDelivery);
		return "main/user/userP";
	}
	
	@ResponseBody
	@GetMapping("/user/userPaySearch")
	public List<SugangVO> userPaySearch(Principal pri, SugangVO vo) {
		vo.setId(pri.getName());	
		System.out.println(vo.getRegDate());
		System.out.println(vo.getExpDate());
		return sugangDao.sugangPay(vo);
	}
	
	// 구매확정
	@ResponseBody
	@PostMapping("/user/userSugangConfirm")
	public void userSugangConfirm(SugangVO vo) {
		sugangDao.updateSugangConfirm(vo);
	}
	
	//수강 결제
	@PostMapping("/user/sugangInsert")
	public String sugangInsert(SugangVO vo,Principal pri) {
		vo.setId(pri.getName());
		sugangDao.sugangInsert(vo);
		if(vo.getUsePoint()!=0) {
			UsersVO user = new UsersVO();
			user.setId(pri.getName());
			user.setPoint(vo.getUsePoint());
			userDao.userPointUpdate(user);
		}
		return "main/all/home";
  }
  
	//강의 수강생 리스트 페이지 이동
	@RequestMapping("/creator/cLecSt")
	public String cLecStPage(SugangVO vo, Model model) {
		vo.setPage(1);
		List<SugangVO> sglist = sugangDao.sugangList(vo);
		if(sglist.isEmpty() != true) {
			int listCnt = sglist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("sglist", sglist);
		return "main/lecture/cLecSt";
	}
	//강의 수강생 리스트 페이지 이동(페이지 번호클릭)
	@RequestMapping("/creator/cLecStpage")
	public String cLecStselectPage(SugangVO vo, Model model, HttpServletRequest request) {
		List<SugangVO> sglist = sugangDao.sugangList(vo);
		if(sglist.isEmpty() != true) {
			int listCnt = sglist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("sglist", sglist);
		return "main/lecture/cLecSt";
	}
	
	//강의 수강생 리스트 페이지 이동(검색)
	@RequestMapping("/creator/cLecStsearch")
	public String cLecStselectPage(SugangVO vo, Model model) {
		String inputName = vo.getNameSearchKey();
		String inputShipCode = vo.getShipStCodeSearchKey();
		if(inputName != null) {
			model.addAttribute("inputName", inputName);
		}
		if(inputShipCode != null) {
			model.addAttribute("inputShipCode", inputShipCode);
		}
		vo.setPage(1);
		List<SugangVO> sglist = sugangDao.sugangList(vo);
		if(sglist.isEmpty() != true) {
			int listCnt = sglist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("sglist", sglist);
		return "main/lecture/cLecSt";
	}
	
	//강의 수강생 리스트 페이지 이동(검색후 번호 클릭)
	@RequestMapping("/creator/cLecStpagesearch")
	public String cLecStselectPagesearch(SugangVO vo, Model model, HttpServletRequest request) {
		String inputName = vo.getNameSearchKey();
		String inputShipCode = vo.getShipStCodeSearchKey();
		if(inputName != null) {
			model.addAttribute("inputName", inputName);
		}
		if(inputShipCode != null) {
			model.addAttribute("inputShipCode", inputShipCode);
		}
		List<SugangVO> sglist = sugangDao.sugangList(vo);
		if(sglist.isEmpty() != true) {
			int listCnt = sglist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
			model.addAttribute("pagination", pagination);
		}
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("sglist", sglist);
		return "main/lecture/cLecSt";
	}
	
	//운송장 번호 입력 업데이트
	@PostMapping("/creator/shipNumUpdate")
	@ResponseBody
	public void shipNumUpdate(SugangVO vo) {
		vo.setShipStCode("D02");
		sugangDao.shipUpdate(vo);
	}
	//반송거부
	@PostMapping("/creator/shipReject")
	@ResponseBody
	public void shipReject(SugangVO vo) {
		vo.setShipStCode("D06");
		sugangDao.shipUpdate(vo);
	}
}
