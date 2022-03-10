package co.makeu.up.lecture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import co.makeu.up.common.view.PageVo;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;


import co.makeu.up.common.view.Pagination;

import co.makeu.up.ltqna.service.LtQnaServiceImpl;
import co.makeu.up.ltqna.service.LtQnaVO;
import co.makeu.up.notice.service.NoticeServiceImpl;
import co.makeu.up.notice.service.NoticeVO;
import co.makeu.up.review.service.ReviewServiceImpl;
import co.makeu.up.review.service.ReviewVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class AdminLectureController {
	@Autowired LectureServiceImpl lectureDao;
	@Autowired LessonServiceImpl lessonDao;
	@Autowired SugangServiceImpl sugangDao;
	@Autowired ReviewServiceImpl reviewDao;
	@Autowired LtQnaServiceImpl ltqnaDao;
	@Autowired NoticeServiceImpl noticeDao;
	
	//강의리스트
	@GetMapping("/admin/adLecL")
	public String adLecL(Model model, LectureVO vo) {
		if(vo.getPage()==0) {
			vo.setPage(1);			
		}
		List<LectureVO> list = lectureDao.adminLectureTable(vo);
		Pagination pagination = new Pagination(list.size()==0 ? 1 : list.get(0).getCount(), vo.getPage());
		model.addAttribute("lectures",list);
		model.addAttribute("pages",pagination);
		model.addAttribute("search",vo);
		return "admin/lecture/adLecL";
	}
	
	//강의상세-강의소개
	@GetMapping("/admin/adLecI")
	public String adLecI(Model model,int ltNo) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		model.addAttribute("ot",lessonDao.LessonOTselect(ltNo));
		return "admin/lecture/adLecI";
	}
	
	//강의상세-유저
	@GetMapping("/admin/adLecU")
	public String adLecU(int ltNo, Model model, SugangVO vo) {
		vo.setLtNo(ltNo);
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		model.addAttribute("userCnt", sugangDao.adminSugangCount(ltNo));	
		List<SugangVO> list =sugangDao.adminLecUserList(vo);
		model.addAttribute("users", list);
		model.addAttribute("pages",new Pagination(list.size()!=0 ? list.get(0).getCnt() : 1, vo.getPage()));
		model.addAttribute("search",vo);
		return "admin/lecture/adLecU";
	}
	
	//강의상세-커리큘럼
	@GetMapping("/admin/adLecC")
	public String adLecC(int ltNo, Model model) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		List<LessonVO> list = lessonDao.lessonList(ltNo);
		model.addAttribute("lessons",list);
		model.addAttribute("cnt",list.size());
		return "admin/lecture/adLecC";
	}
	
	//강의상세-키트
	@GetMapping("/admin/adLecK")
	public String adLecK(int ltNo, Model model, SugangVO vo) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		List<SugangVO> list = sugangDao.adminLecDeliver(vo);
		model.addAttribute("del",list);
		model.addAttribute("pages",new Pagination(list.size()!=0 ? list.get(0).getCnt() : 1, vo.getPage()));
		model.addAttribute("search",vo);
		return "admin/lecture/adLecK";
	}
	
	
	//강의상세-후기
	@GetMapping("/admin/adLecR")
	public String adLecR(int ltNo, Model model, ReviewVO vo) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		List<ReviewVO> list = reviewDao.adminReviewList(vo);
		model.addAttribute("reviews",list);
		model.addAttribute("pages",new Pagination(list.size()!=0 ? list.get(0).getCnt() : 1, vo.getPage()));
		model.addAttribute("search",vo);
		return "admin/lecture/adLecR";
	}
	
	//강의상세-질문/답변
	@GetMapping("/admin/adLecQ")
	public String adLecQ(int ltNo, Model model, LtQnaVO vo) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		List<LtQnaVO> list = ltqnaDao.adminQnaList(vo);
		model.addAttribute("pages",new Pagination(list.size()!=0 ? list.get(0).getCnt() : 1 , vo.getPage()));
		model.addAttribute("qna", list);
		model.addAttribute("search",vo);
		return "admin/lecture/adLecQ";
	}
	
	//강의상세-공지사항
	@GetMapping("/admin/adLecN")
	public String adLecN(int ltNo, Model model, NoticeVO vo) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(ltNo));
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		
		List<NoticeVO> list = noticeDao.adminNoticeList(vo);
		model.addAttribute("notices",list);
		model.addAttribute("pages",new Pagination(list.size()==0 ? 1 : list.get(0).getCount(), vo.getPage()));
		model.addAttribute("search",vo);
		return "admin/lecture/adLecN";
	}
	
	//강의상세-공지사항상세
	@GetMapping("/admin/adLecND")
	public String adLecND(NoticeVO vo, Model model) {
		model.addAttribute("lecInfo",lectureDao.adminLectureInfo(vo.getLtNo()));
		
		NoticeVO notice = noticeDao.NoticeSelects(vo);
		model.addAttribute("notice",notice);
		System.out.println(" eeeeee");
		model.addAttribute("noticeFiles",noticeDao.noticeFiles(notice.getFileNo()));
		return "admin/lecture/adLecND";
	}
	
	//강의등록 조회
	@GetMapping("/admin/adLecAL")
	public String adLecAL(LectureVO vo, Model model) {
		List<LectureVO> llist = lectureDao.adminLectureList(vo);
		model.addAttribute("llists", llist);
		int length = 0;
	      if(llist.size() != 0) {
	         length = llist.get(0).getLength();
	     }
	    model.addAttribute("pageMaker",new PageVo(vo,length));
	    model.addAttribute("search",vo);
		return "admin/lecture/adLecAL";
	}
	
	//강의등록 상세
	@GetMapping("/admin/adLecAS")
	public String adLecAS(LectureVO vo, LessonVO lessonvo, Model model) {
		lessonvo.setLtNo(vo.getLtNo());
		lessonvo.setId(vo.getCreId());
		model.addAttribute("lessonList", lessonDao.lessonList(vo.getLtNo()));
		model.addAttribute("adLecSel", lectureDao.AdminlectureSelect(vo));
		return "admin/lecture/adLecAS";
	}
	
	//강의등록 허가
	@RequestMapping("/admin/adLecALOK")
	public String adLecALOK(LectureVO vo, Model model) {
		lectureDao.AdminlectureUpdateOK(vo);
		List<LectureVO> llist = lectureDao.adminLectureList(vo);
		model.addAttribute("llists", llist);
		int length = 0;
	      if(llist.size() != 0) {
	         length = llist.get(0).getLength();
	     }
	    model.addAttribute("pageMaker",new PageVo(vo,length));
		return "admin/lecture/adLecAL";
	}
	
	//강의등록 반려
	@RequestMapping("/admin/adLecALReject")
	public String adLecALReject(LectureVO vo, Model model) {
		lectureDao.AdminlectureUpdateReject(vo);
		List<LectureVO> llist = lectureDao.adminLectureList(vo);
		model.addAttribute("llists", llist);
		int length = 0;
	      if(llist.size() != 0) {
	         length = llist.get(0).getLength();
	     }
	    model.addAttribute("pageMaker",new PageVo(vo,length));
		return "admin/lecture/adLecAL";
	}	
	
}
