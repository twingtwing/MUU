package co.makeu.up.common.view;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;


@Controller
public class ExcelViewController {
	@Autowired UsersServiceImpl usersDao;
	@Autowired LectureServiceImpl lectureDao;
	
	@RequestMapping("/admin/userExcel")
	public String excel(Model model, UsersVO vo) throws IllegalArgumentException, IllegalAccessException, InstantiationException, InvocationTargetException, NoSuchMethodException, SecurityException {
		if(vo.getuGrdCodeList()==null) {
			String[] grd = {"U01","U02","U03","U04"};
			vo.setuGrdCodeList(grd);
		}
		String[] headers = new String[]{"id","name","tel","gender","zip","addr","detaAddr","uGrdCode","joinDate"};
		vo.setPage(0);
		vo.setEndrow(200);
		List<UsersVO> list = usersDao.usersList(vo);
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","excelFile");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/admin/creatorExcel")
	public String creatorExcel(Model model, UsersVO vo) throws IllegalArgumentException, IllegalAccessException {
		vo.setAuthCode("A03");
		vo.setEndrow(200);
		List<UsersVO> list = usersDao.usersList(vo);
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		String[] headers = new String[]{"id","name","tel","gender","zip","addr","detaAddr","creGrdCode","joinDate"};
		model.addAttribute("datas",convertMapsList);
		model.addAttribute("fileName","creatorList");
		model.addAttribute("headers",headers);
		return "excelView";
	}
	
	@RequestMapping("/admin/lectureExcel")
	public String lectureExcel(Model model, LectureVO vo) throws IllegalArgumentException, IllegalAccessException {
		if(vo.getLtStCodeList()==null) {
			String[] ltstcode = {"L01","L02","L03"};
			vo.setLtStCodeList(ltstcode);
		}
		vo.setPage(0);
		vo.setEndrow(200);
		List<LectureVO> list = lectureDao.adminLectureTable(vo);
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		String[] headers = new String[]{"ltNo","creId","name","ttl","prc","reqDate","avgstar","downCtgr","upCtgr","ltStCode"};
		model.addAttribute("datas",convertMapsList);
		model.addAttribute("fileName","lectureList");
		model.addAttribute("headers",headers);
		return "excelView";
	}
	
}
