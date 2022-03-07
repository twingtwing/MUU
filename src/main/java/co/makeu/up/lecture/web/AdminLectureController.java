package co.makeu.up.lecture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.makeu.up.common.view.PageVo;
import co.makeu.up.ctgr.service.CtgrVO;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.refund.service.RefundVO;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;

@Controller
public class AdminLectureController {
	@Autowired LectureServiceImpl lectureDao;
	
	//강의리스트
	@GetMapping("/admin/adLecL")
	public String adLecL(Model model, LectureVO vo) {
		if(vo.getPage()==0) {
			vo.setPage(1);			
		}
		System.out.println(vo.getLtStCodeList());
		System.out.println(vo.getStar());
		List<LectureVO> list = lectureDao.adminLectureList(vo);
		Pagination pagination = new Pagination(list.get(0).getCount()==0 ? 1 : list.get(0).getCount(), vo.getPage());
		model.addAttribute("lectures",list);
		model.addAttribute("pages",pagination);
		return "admin/lecture/adLecL";
	}
	
	//강의상세-강의소개
	@GetMapping("/admin/adLecI")
	public String adLecI() {
		return "admin/lecture/adLecI";
	}
	
	//강의상세-유저
	@GetMapping("/admin/adLecU")
	public String adLecU() {
		return "admin/lecture/adLecU";
	}
	
	//강의상세-커리큘럼
	@GetMapping("/admin/adLecC")
	public String adLecC() {
		return "admin/lecture/adLecC";
	}
	
	//강의상세-키트
	@GetMapping("/admin/adLecK")
	public String adLecK() {
		return "admin/lecture/adLecK";
	}
	
	//강의상세-후기
	@GetMapping("/admin/adLecR")
	public String adLecR() {
		return "admin/lecture/adLecR";
	}
	
	//강의상세-질문/답변
	@GetMapping("/admin/adLecQ")
	public String adLecQ() {
		return "admin/lecture/adLecQ";
	}
	
	//강의상세-공지사항
	@GetMapping("/admin/adLecN")
	public String adLecN() {
		return "admin/lecture/adLecN";
	}
	
	//강의상세-공지사항상세
	@GetMapping("/admin/adLecND")
	public String adLecND() {
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
		return "admin/lecture/adLecAL";
	}
	
	//강의등록 상세
	@GetMapping("/admin/adLecAS")
	public String adLecAS() {
		return "admin/lecture/adLecAS";
	}
	
}
