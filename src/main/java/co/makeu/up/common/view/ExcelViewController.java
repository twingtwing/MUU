package co.makeu.up.common.view;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.makeu.up.board.service.BoardServiceImpl;
import co.makeu.up.board.service.BoardVO;

@Controller
public class ExcelViewController {
	@Autowired BoardServiceImpl boardDao;
	
	
//	@RequestMapping("/excel")
//	public String excel(Model model) {
//		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		// 값들은 나중에 db에서 가져오면됨
//		map.put("name", "홍길동");
//		map.put("sal", "3000");
//		list.add(map);
//		model.addAttribute("fileName","empList");
//		model.addAttribute("headers", new String[] {"name","sal"});
//		model.addAttribute("datas", list);
//		return "excelView";
//	}

	@RequestMapping("/admin/adBadexcel")
	public String adBadexcel(Model model, BoardVO vo) throws IllegalArgumentException, IllegalAccessException , InstantiationException{
	vo.setPageNum(0);
	String [] headers = new String[] {"bNo","ttl","content","bStCode","wrDate","hits"};
	vo.setAmount(10);
	vo.setPageNum(1);
	List<BoardVO> list = boardDao.selectadbad(vo);
	List<Map<String , Object>> converMapsList  = CommonExcelView.convertVOtoMaps(list);
	model.addAttribute("fileName","boardList");
	model.addAttribute("headers", headers);
	model.addAttribute("datas", converMapsList);
	
	
	return "excelView";
	}
}
