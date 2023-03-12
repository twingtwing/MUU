package co.makeu.up.notice.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import co.makeu.up.common.view.Pagination;
import co.makeu.up.detafile.service.DetafileVO;
import co.makeu.up.files.service.FileMapper;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.notice.service.NoticeServiceImpl;
import co.makeu.up.notice.service.NoticeVO;
import co.makeu.up.progress.service.ProgressServiceImpl;
import co.makeu.up.progress.service.ProgressVO;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;

@Controller
public class NoticeController {
	Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired NoticeServiceImpl noticeDao;
	@Autowired SugangServiceImpl sugangDao;
	@Autowired ProgressServiceImpl progressDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired private String saveDir;
	@Autowired FileMapper fileDao;
	
	//공지사항 리스트 페이지
	@RequestMapping("/creator/cLecNL")
	public String cLecNL(LectureVO lvo, NoticeVO nvo, Model model) {
		nvo.setPage(1);
		List<NoticeVO> nlists = noticeDao.NoticeList(nvo);
		if(nlists.isEmpty() != true) {
			int listCnt = nlists.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("nlists", nlists);
		return "main/lecture/cLecNL";
	}
	//공지사항 리스트 페이지(번호클릭시)
	@RequestMapping("/creator/cLecNLpage")
	public String cLecNLpage(LectureVO lvo, NoticeVO nvo, Model model, HttpServletRequest request) {
		List<NoticeVO> nlists = noticeDao.NoticeList(nvo);
		if(nlists.isEmpty() != true) {
			int listCnt = nlists.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
			model.addAttribute("pagination", pagination);
		}
		
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("nlists", nlists);
		return "main/lecture/cLecNL";
	}
	
	//공지사항 리스트 페이지(검색시)
	@RequestMapping("/creator/cLecNLsearch")
	public String cLecNLsearch(LectureVO lvo, NoticeVO nvo, Model model) {
		String inputTtl = nvo.getTtlSearchKey();
		String inputContent = nvo.getContentSearchKey();
		if(inputTtl != null) {
			model.addAttribute("inputTtl", inputTtl);
		} 
		if (inputContent != null) {
			model.addAttribute("inputContent", inputContent);
		}
		nvo.setPage(1);
		List<NoticeVO> nlists = noticeDao.NoticeList(nvo);
		if(nlists.isEmpty() != true) {
			int listCnt = nlists.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			model.addAttribute("pagination", pagination);
		}
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("nlists", nlists);
		return "main/lecture/cLecNL";
	}
	//공지사항 리스트 페이지(검색후번호클릭시)
	@RequestMapping("/creator/cLecNLpagesearch")
	public String cLecNLpagesearch(LectureVO lvo, NoticeVO nvo, Model model, HttpServletRequest request) {
		String inputTtl = nvo.getTtlSearchKey();
		String inputContent = nvo.getContentSearchKey();
		if(inputTtl != null) {
			model.addAttribute("inputTtl", inputTtl);
		} else if (inputContent != null) {
			model.addAttribute("inputContent", inputContent);
		}
		List<NoticeVO> nlists = noticeDao.NoticeList(nvo);
		if(nlists.isEmpty() != true) {
			int listCnt = nlists.get(0).getCount();
			Pagination pagination = new Pagination(listCnt, 1);
			pagination.setCurrPage(Integer.parseInt(request.getParameter("page")));
			model.addAttribute("pagination", pagination);
		}
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		model.addAttribute("nlists", nlists);
		return "main/lecture/cLecNL";
	}
	
	
	//공지사항 한건 읽기
	@GetMapping("/creator/cLecNS")
	public String cLecNS(LectureVO lvo, NoticeVO nvo, Model model, HttpServletRequest request) {
		nvo = noticeDao.NoticeSelect(nvo);
//		model.addAttribute("noticenNo", request.getParameter("noticeNo"));
		model.addAttribute("noinfo", nvo);
		model.addAttribute("lecinfo", lectureDao.lectureSelect(nvo.getLtNo()));
		noticeDao.updateHits(nvo);
		return "main/lecture/cLecNS";
	}
	//공지사항 수정 페이지 이동
	@RequestMapping("/creator/cLecNU")
	public String cLecNU(LectureVO lvo, NoticeVO nvo, Model model, HttpServletRequest request) {
//		model.addAttribute("noticeNo", request.getParameter("noticeNo"));
		model.addAttribute("noinfo", noticeDao.NoticeSelects(nvo));
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		return "main/lecture/cLecNU";
	}
	
	//공지사항 수정
	@PostMapping("/creator/cLecNUpdate")
	@ResponseBody
	public NoticeVO cLecNUpdate(NoticeVO vo, @RequestParam(value="files", required = false) MultipartFile file,
			MultipartHttpServletRequest multi) {
		List<MultipartFile> fileList = multi.getFiles("files");
		if(fileList.size() != 0) {
			List<DetafileVO> list = new ArrayList<DetafileVO>();
			for (int i = 0; i < fileList.size(); i++) {
				DetafileVO fileVo = new DetafileVO();
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = UUID.randomUUID().toString() + oriFileName;

				try {
					fileList.get(i).transferTo(new File(saveDir + safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				fileVo.setFilePath(oriFileName);
				fileVo.setPhyPath(safeFile);
				list.add(fileVo);
			}
			vo.setDetaFileList(list);
		}
		noticeDao.NoticeUpdate(vo);
		return vo;
	}
	
	//공지사항 삭제
	@RequestMapping("/creator/cLecNdelete")
	public String cLecNdelete(NoticeVO nvo, Model model) {
		noticeDao.deleteNotice(nvo);
		fileDao.delFile(nvo.getFileNo());
		return "redirect:/creator/cLecNL?ltNo="+nvo.getLtNo();
	}
	
	//공지사항 글 등록 페이지
	@GetMapping("/creator/cLecNI")
	public String cLecNI(NoticeVO nvo, LectureVO lvo, Model model, HttpServletRequest request) {
		model.addAttribute("lecinfo", lectureDao.lectureSelect(lvo.getLtNo()));
		nvo = noticeDao.NoticeSelect(nvo);
		return "main/lecture/cLecNI";
	}
	
	//공지사항 글 insert
	@PostMapping("/creator/cLecNInsert")
	@ResponseBody
	public NoticeVO cLecNInsert(NoticeVO vo, @RequestParam(value="files", required = false) MultipartFile file, 
			MultipartHttpServletRequest multi) {
		List<MultipartFile> fileList = multi.getFiles("files");
		if(fileList.size() != 0) {
			List<DetafileVO> list = new ArrayList<DetafileVO>();
			for (int i = 0; i < fileList.size(); i++) {
				DetafileVO fileVo = new DetafileVO();
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = UUID.randomUUID().toString() + oriFileName;
				

				try {
					fileList.get(i).transferTo(new File(saveDir + safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				fileVo.setFilePath(oriFileName);
				fileVo.setPhyPath(safeFile);
				list.add(fileVo);
			}
			vo.setDetaFileList(list);
		}
		noticeDao.insertNotice(vo);
		return vo;
	}
	
	// 공지 리스트
	@GetMapping("/user/userLNL")
	public String userLecNoticeList(NoticeVO vo, Model model, Principal pri){	
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		if(Objects.isNull(checkvo)) {
			logger.info("사용자의 잘못된 접근");
			model.addAttribute("accessBan","잘못된 접근입니다.");
			return "redirect:/accessError";
		} else {
			checkvo.setProgPct(progressDao.wholeProgress(prvo));
			model.addAttribute("sugang",checkvo);
		}		
		vo.setPage(1);
		int listCnt = noticeDao.NoticeListCnt(vo.getLtNo());
		Pagination pagination = new Pagination(listCnt,1);
		model.addAttribute("ltno",vo.getLtNo());
		model.addAttribute("notices",noticeDao.NoticeList(vo));
		model.addAttribute("pagination",pagination);
		return "main/user/userLNL";
	}
	
	// 페이지네이션
	@GetMapping("/user/userNoticePage")
	@ResponseBody
	public List<NoticeVO> userNoticePage(NoticeVO vo) {
		logger.info("ltno는"+vo.getLtNo()+"page는"+vo.getPage());	
		return noticeDao.NoticeList(vo);
	}
	
	@ResponseBody
	@GetMapping("/user/userNoticeSearch")
	public List<NoticeVO> userNoticeSearch(NoticeVO vo) {
		return noticeDao.NoticeList(vo);
	}
	
	// 공지사항 선택
	@GetMapping("/user/userLNS")
	public String userLecNoticeSelect(NoticeVO vo, Model model,Principal pri) {
		ProgressVO prvo = new ProgressVO();
		prvo.setId(pri.getName());
		prvo.setLtNo(vo.getLtNo());
		SugangVO checkvo = new SugangVO();
		checkvo.setId(pri.getName());
		checkvo.setLtNo(vo.getLtNo());
		checkvo = sugangDao.sugangCheckDate(checkvo);
		checkvo.setProgPct(progressDao.wholeProgress(prvo));
		model.addAttribute("sugang",checkvo);
		NoticeVO notice = noticeDao.NoticeSelect(vo);
		model.addAttribute("notice", notice);
		noticeDao.updateHits(vo);
		model.addAttribute("noticeFiles",noticeDao.noticeFiles(notice.getFileNo()));
		return "main/user/userLNS";
	}
}
