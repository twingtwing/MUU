package co.makeu.up.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.board.service.BoardService;
import co.makeu.up.board.service.BoardVO;
import co.makeu.up.page.vo.PageVo;

@Controller
public class BoardController {
	@Autowired private BoardService boardDao;
	
	@GetMapping("/boardL")
	public String boardL() {
		return "main/all/boardL";
	}
	
	
	
	@ResponseBody
	@PostMapping("/selectBoardList")
	public Map<String,Object> selectBoardList(BoardVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BoardVO> list = boardDao.selectBoardList(vo);
		map.put("list",list);
		map.put("page",new PageVo(vo, list.get(0).getCount()));
		return map;
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
	
	@ResponseBody
	@PostMapping("/selectBoard")
	public BoardVO selectBoard(BoardVO vo) {
		return boardDao.selectBoard(vo);
	}
	
	
	//愿�由ъ옄 怨듭��궗�빆 由ъ뒪�듃
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
	
	@GetMapping("/admin/insertBoard")
	public String insertBoard (BoardVO vo) {
		System.out.println("dddd");
		
		boardDao.insertBoard(vo);
		return "/admin/adBadLi";
	}
	@GetMapping("/admin/adBadS")
	public String adBadS(BoardVO vo , Model model) {
		model.addAttribute("list",boardDao.selectadbads());
		return "admin/adbad/adBads";
	}
	@PostMapping("/admin/deladbad")
	public String adBadU (BoardVO vo ) {
		boardDao.deladbad(vo);
	return "/admin/adBadLi";
	}
}
