package co.makeu.up.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.board.service.BoardService;
import co.makeu.up.board.service.BoardVO;

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
	public String adBadLi(BoardVO vo , Model model) {
		model.addAttribute("list",boardDao.selectadbad());
		return "admin/adbad/adBadLi";
	}
	
	
	@GetMapping("/admin/adBadl")
	public String adBadl(BoardVO vo ,Model model) {
		model.addAttribute("list",boardDao.selectadbad());
		return "admin/adbad/adBadl";
	}
	
	@PostMapping("/admin/insertBoard")
	public String insertBoard (BoardVO vo) {
		boardDao.insertBoard(vo);
		return "redirect:/admin/adBadLi";
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
