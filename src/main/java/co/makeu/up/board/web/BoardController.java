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
	
	@GetMapping("/boardL")
	public String boardL() {
		return "main/all/boardL";
	}
	
	@ResponseBody
	@PostMapping("/selectBoardList")
	public List<BoardVO> selectBoardList() {
		return boardDao.selectBoardList();
	}
	
	@ResponseBody
	@GetMapping("/selectTtlList")
	public List<BoardVO> selectTtlList(BoardVO vo){
		return boardDao.selectTtlList(vo);
	}
	
	@GetMapping("/boardS")
	public String boardS(BoardVO vo,Model model) {
		model.addAttribute("bno",vo.getBNo());
		return "main/all/boardS";
	}
}
