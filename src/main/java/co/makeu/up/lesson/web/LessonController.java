package co.makeu.up.lesson.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import co.makeu.up.lesson.service.LessonServiceImpl;
import co.makeu.up.lesson.service.LessonVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;

@Controller
public class LessonController {
	Logger logger = LoggerFactory.getLogger(LessonController.class);
	@Autowired LessonServiceImpl lessonDao;
	@Autowired ProgressServiceImpl progressDao;
	@Autowired String saveDir;
	
	@PostMapping("/user/userLW")
	public String userLessonWatch(LessonVO vo, Model model, Principal pri) {
		vo.setId(pri.getName());
		model.addAttribute("firstLesson",lessonDao.ajaxLessonSelect(vo.getSerialNo()));
		model.addAttribute("lessons",lessonDao.lessonList(vo.getLtNo()));
		ProgressVO progressvo = new ProgressVO();
		progressvo.setId(pri.getName());
		progressvo.setSerialNo(vo.getSerialNo());
		progressvo = progressDao.selectProgress(progressvo);
		if(progressvo==null) {
			logger.info("null값입니다! ");
			ProgressVO pgrvo = new ProgressVO();
			pgrvo.setId(pri.getName());
			pgrvo.setSerialNo(vo.getSerialNo());
			pgrvo.setProgPct(0);
			progressDao.insertProgress(pgrvo);
		}
		return "main/user/userLW";
	}
	
	// 수업 누르면 영상바뀌게
	@ResponseBody
	@GetMapping("/user/userLWselect")
	public LessonVO userLWselect(int serialNo, LessonVO vo, Principal pri) {
		ProgressVO progressvo = new ProgressVO();
		progressvo.setId(pri.getName());
		progressvo.setSerialNo(serialNo);
		progressvo = progressDao.selectProgress(progressvo);
		System.out.println(progressvo);
		if(progressvo==null) {
			ProgressVO pgrvo = new ProgressVO();
			pgrvo.setId(pri.getName());
			pgrvo.setSerialNo(vo.getSerialNo());
			pgrvo.setProgPct(0);
			progressDao.insertProgress(pgrvo);
		}	
		vo = lessonDao.ajaxLessonSelect(serialNo);
		return vo;
	}
	
	//수업 영상 관리 페이지
	@RequestMapping("/creator/lesU")
	public String lessonUpdatePage(LessonVO vo, Model model) {
		model.addAttribute("lesinfo", lessonDao.lessonList(vo.getLtNo()));
		model.addAttribute("ltNo", vo.getLtNo());
		return "main/lecture/lesU";
	}
	
	@PostMapping("/creator/lessonUpdate")
	@ResponseBody
	public void lessonUpdate(MultipartHttpServletRequest multi,
			@RequestParam(value="ltNo", required = false) int ltNo,
			@RequestParam(value="lsnNos", required = false) int[] lsnNos,
			@RequestParam(value="ttls", required = false) String[] ttls,
			@RequestParam(value="oriFiles", required = false) String[] oriFiles,
			@RequestParam(value="delFiles", required = false) String[] delFiles) {
		
		//수업 추가
		List<LessonVO> lesList = new ArrayList<LessonVO>();
		List<MultipartFile> classList = multi.getFiles("lsnFile");

		int cnt = 0;
		for(int i = 0; i < lsnNos.length; i++) {
			LessonVO lvo = new LessonVO();
			lvo.setLtNo(ltNo);
			lvo.setLsnNo(lsnNos[i]);
			lvo.setTtl(ttls[i]); 
			
			if(oriFiles[i].equals("N")) {
				String oriFileName = classList.get(cnt).getOriginalFilename();
				String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
				
				lvo.setLsnFile("/upload/" + safeFile.substring(saveDir.length()));
				
				try {
					classList.get(cnt).transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				cnt++;
			}else {
				lvo.setLsnFile(oriFiles[i]);
			}
			lesList.add(lvo);
		}
		
		lessonDao.lessonUpdate(lesList);
		
		
		//수업 삭제 -- 있으면 하라고 조건 달아야함
		if(delFiles != null) {
			LessonVO vo = new LessonVO();
			for (int i = 0; i < delFiles.length; i++) {
				File file = new File(saveDir+delFiles[i].substring("/upload/".length()));
				if(file.exists()) {
					file.delete();
				}
			}
			vo.setLtNo(ltNo);
			vo.setLsnNo(lsnNos.length);
			lessonDao.delLesson(vo);
		}
	}


}
