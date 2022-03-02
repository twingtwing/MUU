package co.makeu.up.lecture.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

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

@Controller
public class LectureController {
	@Autowired
	private LectureServiceImpl lectureDao;
	
	@Autowired
	private LessonServiceImpl lessonDao;
	
	@Autowired
	private String saveDir;
	
	@GetMapping("/creator/lecI")
	public String lectureInsertPage(Model model, Principal principal) {
		model.addAttribute("id", principal.getName());
		return "main/lecture/lecI";
	}
	
	//강의검색
	@GetMapping("/lecS")
	public String lecS() {
		return "main/lecture/lecS";
	}
	
	//강의상세
	@GetMapping("/lecD")
	public String lecD() {
		return "main/lecture/lecD";
	}
	
	//강의임시저장
	@PostMapping("/creator/lectureTempResister")
	public String lectureTempResister(LectureVO vo, @RequestParam(value = "mainPhtUp", required = false) MultipartFile file, MultipartHttpServletRequest multi,
			@RequestParam(value="lecFile", required = false) String[] lecList) {
		
		return null;
	}
	
	//강의상세-공지사항
	@GetMapping("/lecN")
	public String lecN() {
		return "main/lecture/lecN";
	}
	
	//강의 결제
	@GetMapping("/lecP")
	public String lecP() {
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
	public String classUploadTest(LectureVO vo, @RequestParam(value="class", required = false) MultipartFile classfile, MultipartHttpServletRequest multi) {
		List<MultipartFile> fileList = multi.getFiles("class");
		System.out.println(fileList);
		for (int i = 0; i < fileList.size(); i++) {
			String oriFileName = fileList.get(i).getOriginalFilename();
			System.out.println(oriFileName);
			String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
			

			try {
				fileList.get(i).transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	
	
	//강의등록
	@PostMapping("/creator/lectureResister")
	@ResponseBody
	public void lectureResister(LectureVO vo, LessonVO lvo,
			@RequestParam(value = "mainPhtUp", required = false) MultipartFile file, MultipartHttpServletRequest multi,
			@RequestParam(value="lecFile", required = false) String[] lecList, @RequestParam(value="class", required = false) MultipartFile classfile,
			@RequestParam(value="classTtl", required = false) String[] classTitle) {
			
			vo.setCreId(lecList[13]);
			vo.setUpCtgr(lecList[0]);
			vo.setDownCtgr(lecList[1]);
			vo.setTtl(lecList[2]);
			vo.setIntro(lecList[3]);
			vo.setOpenTerm(Integer.parseInt(lecList[4]));
			vo.setTlsnTerm(Integer.parseInt(lecList[5]));
			vo.setKitName(lecList[6]);
			vo.setKitIntro(lecList[7]);
			vo.setKitPrc(Integer.parseInt(lecList[8]));
			vo.setPrc(Integer.parseInt(lecList[9]));
			vo.setTag1(lecList[10]);
			vo.setTag2(lecList[11]);
			vo.setTag3(lecList[12]);
			//임시 바꿔야함 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			//vo.setStartDate(null);
	
			// 대표사진, 썸네일 등록
			List<MultipartFile> fileList = multi.getFiles("mainPhtUp");
					
			for (int i = 0; i < fileList.size(); i++) {
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				if(i == 0) {
					vo.setPht1("/upload/" + safeFile.substring(saveDir.length()));
				}
				if(i == 1) {
					vo.setPht2("/upload/" + safeFile.substring(saveDir.length()));
				}
				if(i == 2) {
					vo.setPht3("/upload/" + safeFile.substring(saveDir.length()));
				}
			    if(i == 3) {
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
				Thread.sleep(3000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			
			// 수업 등록
			List<MultipartFile> classList = multi.getFiles("class");
			
			for(int i = 0; i < classList.size(); i++) {
				String oriFileName = classList.get(i).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				
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
		model.addAttribute("rlists", lectureDao.requestLecture(vo));
		return "main/lecture/rLecL";
	}
	
	//열린 강의 리스트 페이지
	@RequestMapping("/creator/oLecL")
	public String openLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		model.addAttribute("olists", lectureDao.openLecture(vo));
		return "main/lecture/oLecL";
	}
	
	//닫힌 강의 리스트 페이지
	@RequestMapping("/creator/clLecL")
	public String closeLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		model.addAttribute("cllists", lectureDao.closeLecture(vo));
		return "main/lecture/clLecL";
	}
	
	//신고된 강의 리스트 페이지
	@RequestMapping("/creator/rpLecL")
	public String reportLecList(LectureVO vo, Model model, Principal principal) {
		vo.setCreId(principal.getName());
		model.addAttribute("rplists", lectureDao.reportLecture(vo));
		return "main/lecture/rpLecL";
	}
	
	//신청 강의 상세 페이지
	@RequestMapping("/creator/rLecS")
	public String requestLecSelect(int sendltno) {
			lectureDao.lectureSelect(sendltno);
		return "main/lecture/rLecS";
	}

}
