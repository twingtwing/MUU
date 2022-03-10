package co.makeu.up.ltqna.web;

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
import co.makeu.up.ltqna.service.LtQnaServiceImpl;
import co.makeu.up.ltqna.service.LtQnaVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class LtQnaController {
	Logger logger = LoggerFactory.getLogger(LtQnaController.class);
	@Autowired LtQnaServiceImpl ltqnaDao;
	@Autowired SugangServiceImpl sugangDao;
	@Autowired ProgressServiceImpl progressDao;
	@Autowired LectureServiceImpl lectureDao;
	
	@GetMapping("/user/userLQ")
	public String userLecQuestion(LtQnaVO vo ,Model model, Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","사용자가 잘못된 방식으로 만료된 강의에 접근하려고 합니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
		}	
		
		vo.setPage(0);
		vo.setWriter(pri.getName());
		List<LtQnaVO> mylist = ltqnaDao.selectMyQnaList(vo);
		List<LtQnaVO> list = ltqnaDao.selectQnaList(vo);
		Pagination pagination = new Pagination(ltqnaDao.qnaListCnt(vo.getLtNo()),1);
		model.addAttribute("pagination",pagination);
		model.addAttribute("myList",mylist);
		model.addAttribute("qnaList",list);
		model.addAttribute("ltNo",vo.getLtNo());
		return "main/user/userLQ";
	}
	
	@GetMapping("/user/userLQpage")
	@ResponseBody
	public List<LtQnaVO> userLQpage(LtQnaVO vo){
		return ltqnaDao.selectQnaList(vo);
	}
	
	@GetMapping(value="/user/selectQna", produces="application/json;charset=utf8")
	@ResponseBody
	public LtQnaVO selectQna(int qnaNo, LtQnaVO vo) {
		logger.info(ltqnaDao.selectQna(qnaNo).getaContent());
		vo = ltqnaDao.selectQna(qnaNo);
		return vo;
	}
	
	@PostMapping("/user/userInsertLQ")
	@ResponseBody
	public LtQnaVO userInsertLQ(LtQnaVO vo, Principal pri) {
		vo.setWriter(pri.getName());
		ltqnaDao.insertQna(vo);
		return vo;
	}
	
	@PostMapping("/user/updateMyqna")
	@ResponseBody
	public void updateMyQna(LtQnaVO vo) {
		ltqnaDao.updateMyQna(vo);
	}
	
	@PostMapping("/user/deleteMyqna")
	@ResponseBody
	public void deleteMyqna(LtQnaVO vo) {
		ltqnaDao.deleteMyQna(vo.getQnaNo());
	}
	
	//강의 qna 페이지 이동
	@RequestMapping("/creator/cLecQ")
	public String cLecQPage(LtQnaVO vo, Model model) {
		vo.setPage(1);
		List<LtQnaVO> qnalist = ltqnaDao.selectQnaList(vo);
		if(qnalist.isEmpty() != true) {
			int listCnt = qnalist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("qnalist", qnalist);
		return "main/lecture/cLecQ";
	}
	
	//강의 qna 페이지(번호클릭시)
	@RequestMapping("/creator/cLecQpage")
	public String cLecQpagination(LtQnaVO vo, Model model, HttpServletRequest request) {
		List<LtQnaVO> qnalist = ltqnaDao.selectQnaList(vo);
		if(qnalist.isEmpty() != true) {
			int listCnt = qnalist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
			model.addAttribute("pagination", pagination);
		}
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("qnalist", qnalist);
		return "main/lecture/cLecQ";
	}
	
	
	//강의 qna 페이지(검색)
	@RequestMapping("/creator/cLecQsearch")
	public String cLecQsearchPage(LtQnaVO vo, Model model) {
		String inputWriter = vo.getWriterSearchKey();
		String inputContent = vo.getContentSearchKey();
		String inputQnaStCode = vo.getQnaStCodeSearchKey();
		if(inputWriter != null || inputWriter != "") {
			model.addAttribute("inputWriter", inputWriter);
		}
		if (inputContent != null || inputContent != "") {
			model.addAttribute("inputContent", inputContent);
		}
		if(inputQnaStCode != null || inputQnaStCode != "") {
			model.addAttribute("inputQnaStCode", inputQnaStCode);
		}
		vo.setPage(1);
		List<LtQnaVO> qnalist = ltqnaDao.selectQnaList(vo);
		if(qnalist.isEmpty() != true) {
			int listCnt = qnalist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			model.addAttribute("pagination", pagination);
		}
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("qnalist", qnalist);
		return "main/lecture/cLecQ";
	}
	
	//강의 qna 페이지(검색후 번호 클릭)
	@RequestMapping("/creator/cLecQpagesearch")
	public String cLecQsearchPage(LtQnaVO vo, Model model, HttpServletRequest request) {
		String inputWriter = vo.getWriterSearchKey();
		String inputContent = vo.getContentSearchKey();
		String inputQnaStCode = vo.getQnaStCodeSearchKey();
		if(inputWriter != null) {
			model.addAttribute("inputWriter", inputWriter);
		}
		if (inputContent != null) {
			model.addAttribute("inputContent", inputContent);
		}
		if(inputQnaStCode != null) {
			model.addAttribute("inputQnaStCode", inputQnaStCode);
		}
		List<LtQnaVO> qnalist = ltqnaDao.selectQnaList(vo);
		if(qnalist.isEmpty() != true) {
			int listCnt = qnalist.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
			model.addAttribute("pagination", pagination);
		}
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		model.addAttribute("qnalist", qnalist);
		return "main/lecture/cLecQ";
	}
	
	//qna 답변 업데이트
	@PostMapping("/creator/cLecQupdate")
	@ResponseBody
	public void cLecQupdate(LtQnaVO vo) {
		ltqnaDao.updateQnaAnswer(vo);
	}
	
	
}
