package co.makeu.up.lecture.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
	
	@GetMapping("/lecS")
	public String lecS() {
		return "main/lecture/lecS";
	}
	
	@GetMapping("/lecD")
	public String lecD() {
		return "main/lecture/lecD";
  }
	@PostMapping("/creator/lectureResister")
	public String lectureResister(LectureVO vo, @RequestParam(value = "mainPhtUp", required = false) MultipartFile file, MultipartHttpServletRequest multi,
			@RequestParam(value="lecFile", required = false) String[] lecList) {
			// 데이터 넘어오는지 확인하고 지울것
			System.out.println(lecList[0]);
			System.out.println(lecList[1]);
	
			// 대표사진 등록
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
				try {
					fileList.get(i).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
						
			}
			
			//썸네일 등록 
		
		return null;
	}

}
