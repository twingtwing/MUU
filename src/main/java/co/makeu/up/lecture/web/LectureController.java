package co.makeu.up.lecture.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.report.service.ReportVO;

@Controller
public class LectureController {
	@Autowired
	private LectureServiceImpl lectureDao;
	
	@Autowired
	private LessonServiceImpl lessonDao;
	
	@Autowired
	private String saveDir;
	
	//강의등록 페이지 이동 / 임시저장 불러오는 페이지 이동
	@GetMapping("/creator/lecI")
	public String lectureInsertPage(LectureVO vo, Model model, Principal principal) {
		model.addAttribute("id", principal.getName());
		
		//임시저장페이지에서 이용, 해당 아이디에 임시저장파일이 있으면 lecItemp로 이동
		vo.setCreId(principal.getName());
		LectureVO volist = lectureDao.lectureInsertTemp(vo);
		LectureVO reallist = lectureDao.lectureTempSelect(vo);
		if(reallist != null) {
			model.addAttribute("tempinfo", volist);
			return "main/lecture/lecItemp";
		} else {
			return "main/lecture/lecI";
		}
	}
	
	//강의검색
	@GetMapping("/lecS")
	public String lecS(LectureVO vo, Model model) {
		model.addAttribute("upCtgr",vo.getUpCtgr());
		model.addAttribute("downCtgr",vo.getDownCtgr());
		return "main/lecture/lecS";
	}
	
	//강의상세
	@GetMapping("/lecD")
	public String lecD(LectureVO vo, Model model) {
		model.addAttribute("ltNo",vo.getLtNo());
		return "main/lecture/lecD";
	}
	
	//강의임시저장 업데이트
	@PostMapping("/creator/lectureTempUpdate")
	@ResponseBody
	public void lectureTempUpdate(LectureVO vo, LessonVO lvo,
			MultipartHttpServletRequest multi,
			@RequestParam(value="lsnNo", required = false) int[] lsnNo,
			@RequestParam(value="classTtl", required = false) String[] classTitle) {
	
			// 대표사진, 썸네일 등록
			List<MultipartFile> fileList = multi.getFiles("mainPhtUp");
					
			for (int i = 0; i < fileList.size(); i++) {
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				if(i == 0) {
					vo.setPht1("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 1) {
					vo.setPht2("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 2) {
					vo.setPht3("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 3) {
	                vo.setThumb("/upload/" + safeFile.substring(saveDir.length()));
	            }

				try {
					fileList.get(i).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			lectureDao.lectureUpdateTemp(vo);
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			
			// 수업 등록
//			List<MultipartFile> classList = multi.getFiles("classMov");
//			
//			for(int i = 0; i < classList.size(); i++) {
//				String oriFileName = classList.get(i).getOriginalFilename();
//				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
//				
//				lvo.setLsnNo(lsnNo[i]);
//				lvo.setTtl(classTitle[i]); 
//				lvo.setLsnFile("/upload/" + safeFile.substring(saveDir.length()));
//				
//				try {
//					classList.get(i).transferTo(new File(safeFile));
//				} catch (IllegalStateException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//				lessonDao.lessonInsert(lvo);
//			}
	}
	
	//강의상세-공지사항
	@GetMapping("/lecN")
	public String lecN(LectureVO vo, Model model) {
		model.addAttribute("ltNo",vo.getLtNo());
		return "main/lecture/lecN";
	}
	
	//강의 결제
	@GetMapping("/user/lecP")
	public String lecP(Model model,@Param("ltNo") int ltNo) {
		model.addAttribute("ltNo",ltNo);
		return "main/lecture/lecP";
	}
	
	//영상 업로드 테스트 >>>>> 강의 등록 종속 시키기
	@RequestMapping("/creator/aaa")
	public String testPage(Model model, Principal principal) {
		model.addAttribute("id", principal.getName());
		return "main/lecture/classTest";
	}
	@PostMapping("/creator/classUpload")
	@ResponseBody
	public String classUploadTest(LectureVO vo, MultipartHttpServletRequest multi) {
		List<MultipartFile> fileList = multi.getFiles("class");
		for (int i = 0; i < fileList.size(); i++) {
			MultipartFile file = fileList.get(i);
			if(file != null && file.getSize() > 0) {
				String oriFileName = file.getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;				
				
				try {
					fileList.get(i).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		return null;
	}
	
	
	
	//강의등록
	@PostMapping("/creator/lectureResister")
	@ResponseBody
	public void lectureResister(LectureVO vo, LessonVO lvo,
			MultipartHttpServletRequest multi,
			@RequestParam(value="lsnNo", required = false) int[] lsnNo,
			@RequestParam(value="classTtl", required = false) String[] classTitle) {
	
			// 대표사진, 썸네일 등록
			List<MultipartFile> fileList = multi.getFiles("mainPhtUp");
					
			for (int i = 0; i < fileList.size(); i++) {
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				if(i == 0) {
					vo.setPht1("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 1) {
					vo.setPht2("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 2) {
					vo.setPht3("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 3) {
	                vo.setThumb("/upload/" + safeFile.substring(saveDir.length()));
	            }

				try {
					fileList.get(i).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			lectureDao.lectureInsert(vo);
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			
			// 수업 등록
			List<MultipartFile> classList = multi.getFiles("classMov");
			
			for(int i = 0; i < classList.size(); i++) {
				String oriFileName = classList.get(i).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				
				lvo.setLsnNo(lsnNo[i]);
				lvo.setTtl(classTitle[i]); 
				lvo.setLsnFile("/upload/" + safeFile.substring(saveDir.length()));
				
				try {
					classList.get(i).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				lessonDao.lessonInsert(lvo);
			}
	}
	
	//신청 강의 리스트 페이지
	@RequestMapping("/creator/rLecL")
	public String requestLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		List<LectureVO> list = lectureDao.requestLecture(vo); 
		model.addAttribute("rlists", list);
		if(list.isEmpty() != true) {
			int listCnt = list.size();
			model.addAttribute("listCnt", listCnt);
		}
		return "main/lecture/rLecL";
	}
	
	//열린 강의 리스트 페이지
	@RequestMapping("/creator/oLecL")
	public String openLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		List<LectureVO> list = lectureDao.openLecture(vo); 
		model.addAttribute("olists", list);
		if(list.isEmpty() != true) {
			int listCnt = list.size();
			model.addAttribute("listCnt", listCnt);
		}
		return "main/lecture/oLecL";
	}
	
	//닫힌 강의 리스트 페이지
	@RequestMapping("/creator/clLecL")
	public String closeLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		List<LectureVO> list = lectureDao.closeLecture(vo); 
		model.addAttribute("cllists", list);
		if(list.isEmpty() != true) {
			int listCnt = list.size();
			model.addAttribute("listCnt", listCnt);
		}
		return "main/lecture/clLecL";
	}
	
	//신고된 강의 리스트 페이지
	@RequestMapping("/creator/rpLecL")
	public String reportLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		List<LectureVO> list = lectureDao.reportLecture(vo); 
		model.addAttribute("rplists", list);
		if(list.isEmpty() != true) {
			int listCnt = list.size();
			model.addAttribute("listCnt", listCnt);
		}
		return "main/lecture/rpLecL";
	}
	
	//신청 강의 상세 페이지
	@RequestMapping("/creator/rLecS")
	public String requestLecSelect(LectureVO vo, Model model) {
			model.addAttribute("rlists", lectureDao.lectureSelect(vo.getLtNo()));
		return "main/lecture/rLecS";
	}
	
	//열린 강의 상세 페이지
	@RequestMapping("/creator/oLecS")
	public String openLecSelect(LectureVO vo, Model model) {
			model.addAttribute("olists", lectureDao.lectureSelect(vo.getLtNo()));
		return "main/lecture/oLecS";
	}
	
	//닫힌 강의 상세 페이지
	@RequestMapping("/creator/clLecS")
	public String closeLecSelect(LectureVO vo, Model model) {
			model.addAttribute("cllists", lectureDao.lectureSelect(vo.getLtNo()));
		return "main/lecture/clLecS";
	}
		
	//신고된 강의 상세 페이지
	@RequestMapping("/creator/rpLecS")
	public String reportLecSelect(LectureVO vo, ReportVO rvo, Model model) {
			model.addAttribute("rplists", lectureDao.lectureSelect(vo.getLtNo()));
			model.addAttribute("rplesson", lectureDao.reportLesson(rvo));
		return "main/lecture/rpLecS";
	}
	
	//강의 수정 페이지
	@RequestMapping("/creator/lecU")
	public String lectureUpdatePage(LectureVO vo, Model model) {
		model.addAttribute("lecinfo", lectureDao.lectureSelect(vo.getLtNo()));
		return "main/lecture/lecU";
	}
	
	//강의 수정
	@PostMapping("/creator/lecUpdate")
	@ResponseBody
	public void lectureUpdate(HttpServletRequest request, LectureVO vo, 
			MultipartHttpServletRequest multi) {
		MultipartFile pht1 = multi.getFile("pht11");
		MultipartFile pht2 = multi.getFile("pht22");
		MultipartFile pht3 = multi.getFile("pht33");
		MultipartFile thumb = multi.getFile("thumbb");
		
		List<MultipartFile> filelist = new ArrayList<MultipartFile>();
		filelist.add(pht1);
		filelist.add(pht2);
		filelist.add(pht3);
		filelist.add(thumb);
		
		for(int i = 0; i < filelist.size(); i++) {
			if(filelist.get(i) != null) {
				String oriFileName = filelist.get(i).getOriginalFilename();
				String safeFile = saveDir + "/" + UUID.randomUUID().toString() + oriFileName;
				if(i == 0) {
					vo.setPht1("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 1) {
					vo.setPht2("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 2) {
					vo.setPht3("/upload/" + safeFile.substring(saveDir.length()));
				} else if(i == 3) {
	                vo.setThumb("/upload/" + safeFile.substring(saveDir.length()));
	            }
	
				try {
					filelist.get(i).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		lectureDao.lectureUpdate(vo);
	}
	
	//신청페이지 재신청
	@RequestMapping("/creator/lecReResister")
	public String lecReResister(LectureVO vo) {
		lectureDao.lectureReResister(vo);
		return "main/lecture/rLecS";
	}
	
	//신고페이지 재검토
	@PostMapping("/creator/lecRpCheck")
	@ResponseBody
	public void lecRpCheck(LectureVO vo) {
		lectureDao.lectureReportCheck(vo);
	}
	
	//종료페이지 재등록
	@PostMapping("/creator/lecReInsert")
	@ResponseBody
	public void lecReInsert(LectureVO vo) {
		lectureDao.lectureReInsert(vo);
	}
	
	//임시저장 값 삭제
	@RequestMapping("/creator/lecDelete")
	public String lecDelete(LectureVO vo) {
		lectureDao.lectureDelete(vo);
		return "redirect:/creator/creS";
	}

}
