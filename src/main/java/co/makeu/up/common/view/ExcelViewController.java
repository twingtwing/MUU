package co.makeu.up.common.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExcelViewController {
	@RequestMapping("/excel")
	public String excel(Model model) {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 값들은 나중에 db에서 가져오면됨
		map.put("name", "홍길동");
		map.put("sal", "3000");
		list.add(map);
		model.addAttribute("fileName","empList");
		model.addAttribute("headers", new String[] {"name","sal"});
		model.addAttribute("datas", list);
		return "excelView";
	}
}
