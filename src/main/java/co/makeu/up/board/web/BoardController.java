package co.makeu.up.board.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.makeu.up.board.service.BoardService;
import co.makeu.up.board.service.BoardVO;
import co.makeu.up.common.view.PageVo;
import co.makeu.up.detafile.service.DetafileVO;

@Controller
public class BoardController {
	@Autowired private BoardService boardDao;
	
	//공지사항 리스트 - MAIN
	@GetMapping("/boardL")
	public String boardL() {
		return "main/all/boardL";
	}

	//공지사항 LIST AJAX
	@ResponseBody
	@PostMapping("/selectBoardList")
	public List<BoardVO> selectBoardList(BoardVO vo) {
		return boardDao.selectBoardList();
	}
	
	//개별 공지사항 이동 - main
	@GetMapping("/boardS")
	public String boardS(BoardVO vo,Model model) {
		model.addAttribute("bno",vo.getBNo());
		return "main/all/boardS";
	}
	
	//개별 공지사항 값 가져오기 - main
	@ResponseBody
	@PostMapping("/selectBoard")
	public BoardVO selectBoard(BoardVO vo) {
		return boardDao.selectBoard(vo);
	}
	
	
	//공지사항 list - admin
	@GetMapping("/admin/adBadLi")
	public String adBadLi(BoardVO vo, Model model) {
		List<BoardVO> list = boardDao.selectadbad(vo);
		model.addAttribute("list",list);
		int length = 0;
		if(list.size() != 0) {
			length = list.get(0).getLength();
		}
		model.addAttribute("pageMaker",new PageVo(vo,length));
		return "admin/adbad/adBadLi";
	}
	
	
	@GetMapping("/admin/adBadl")
	public String adBadl( ) {
		return "admin/adbad/adBadl";
	}
	
	@ResponseBody
	@PostMapping("/admin/insertBoard")
	public BoardVO insertBoard (BoardVO vo,@RequestParam(value="files", required = false) MultipartFile file, MultipartHttpServletRequest multi) {
		List<MultipartFile> fileList = multi.getFiles("files");
		if(fileList.size() != 0) {
			List<DetafileVO> list = new ArrayList<DetafileVO>();
			for (int i = 0; i < fileList.size(); i++) {
				DetafileVO fileVo = new DetafileVO();
				String oriFileName = fileList.get(i).getOriginalFilename();
				String safeFile = UUID.randomUUID().toString() + oriFileName;
				

				try {
					fileList.get(i).transferTo(new File(safeFile));
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
		boardDao.insertBoard(vo);
		return vo;
	}
	
	@GetMapping("/admin/adBadS")
	public String adBadS(BoardVO vo , Model model) {
		model.addAttribute("board",boardDao.selectadbads(vo));
		return "admin/adbad/adBadS";
	}
	
	@PostMapping("/admin/deladbad")
	@ResponseBody
	public int deladbad (BoardVO vo ) {
		System.out.println("dddddd");
		int r = boardDao.deladbad(vo);
		System.out.println("");
		return r;
	}
	
	@GetMapping("/admin/adBadU")
	public String adBadU(BoardVO vo , Model model) {
		model.addAttribute("board",boardDao.selectadbads(vo));
		return "admin/adbad/adBadU";
	}
	
	@PostMapping("/admin/upadbad")
	@ResponseBody
	public int upadbad(BoardVO vo) {
		System.out.println("제발");
		int dd =boardDao.upadbad(vo);
		return dd;
		
	}
}
