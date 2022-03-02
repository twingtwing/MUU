package co.makeu.up.lecture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminLectureController {

	//강의리스트
	@GetMapping("/admin/adLecL")
	public String adLecL() {
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
	public String adLecAL() {
		return "admin/lecture/adLecAL";
	}
	
	//강의등록 상세
	@GetMapping("/admin/adLecAS")
	public String adLecAS() {
		return "admin/lecture/adLecAS";
	}
	
}
