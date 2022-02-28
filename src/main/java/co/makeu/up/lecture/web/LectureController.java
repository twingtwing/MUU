package co.makeu.up.lecture.web;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;

@Controller
public class LectureController {
	@Autowired
	private LectureServiceImpl lectureDao;
	
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
	
	//강의등록
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
	
	@PostMapping("/creator/lectureResister")
	public void lectureResister(LectureVO vo, @RequestParam(value = "mainPhtUp", required = false) MultipartFile file, MultipartHttpServletRequest multi,
			@RequestParam(value="lecFile", required = false) String[] lecList) {
			// 데이터 넘어오는지 확인하고 지울것 !!!!!!!!!!!!!!!!!!!!
			System.out.println(lecList[0]+" : "+lecList[1]);
			System.out.println(lecList[2]+" : "+lecList[3]);
			System.out.println(lecList[4]+" : "+lecList[5]);
			System.out.println(lecList[6]+" : "+lecList[7]+" : "+lecList[8]);
			System.out.println(lecList[9]);
			System.out.println(lecList[10]+" : "+lecList[11]+" : "+lecList[12]);
			System.out.println(lecList[13]);
			
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
			vo.setStartDate(null);
	
			// 대표사진, 썸네일 등록
			List<MultipartFile> fileList = multi.getFiles("mainPhtUp");
					
			for (int i = 0; i < fileList.size(); i++) {
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				if(i == 0) {
					vo.setPht1(safeFile);
				}
				if(i == 1) {
					vo.setPht2(safeFile);
				}
				if(i == 2) {
					vo.setPht3(safeFile);
				}
			    if(i == 3) {
	                vo.setThumb(safeFile);
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
		//강의리스트로 돌아가게 바꿔야함 !!!!!!!!!!!!!!!! 
		//return "main/creator/creS";
	}

}
