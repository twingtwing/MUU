package co.makeu.up.common.view;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import co.makeu.up.board.service.BoardServiceImpl;
import co.makeu.up.board.service.BoardVO;

import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;


@Controller
public class ExcelViewController {
	@Autowired UsersServiceImpl usersDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired RefundServiceImpl refundDao;
	@Autowired BoardServiceImpl boardDao;
	
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


	@RequestMapping("/admin/refundExcel")
	public String excel(Model model, RefundVO vo)
			throws IllegalArgumentException, IllegalAccessException, InstantiationException {
		String[] headers = new String[] { "tlsnNo", "id", "ttl", "regDate", "reqDate", "content", "pay", "rfStCode" };
		vo.setPage(0);
		System.out.println(vo.toString());
		List<RefundVO> rlist = refundDao.adminRefundListSearch(vo);
		for (RefundVO temp : rlist) {
			if (temp.getRfStCode().equals("RF02") ) {
				temp.setRfStCode("환불완료");
			} else if (temp.getRfStCode().equals("RF03")) {
				temp.setRfStCode("환불거부");
			} else {
				temp.setRfStCode("환불신청대기");
			}
		}
		List<Map<String, Object>> converMapsList = CommonExcelView.convertVOtoMaps(rlist);
		model.addAttribute("fileName", "excelFile");
		model.addAttribute("headers", headers);
		model.addAttribute("datas", converMapsList);
		return "excelView";
	}
	
	@RequestMapping("/admin/adminLectureRegExcel")
	public String Regexcel(Model model, LectureVO vo)
			throws IllegalArgumentException, IllegalAccessException, InstantiationException {
		String[] headers = new String[] { "ltNo", "upCtgr", "downCtgr", "creId", "name", "reqDate", "ltStCode"};
		vo.setPage(0);
		System.out.println(vo.toString());
		List<LectureVO> llist = lectureDao.adminLectureList(vo);
		for (LectureVO temp : llist) {
			if (temp.getLtStCode().equals("L02") ) {
				temp.setLtStCode("강의등록대기");
			}
		}
		List<Map<String, Object>> converMapsList = CommonExcelView.convertVOtoMaps(llist);
		model.addAttribute("fileName", "excelFile");
		model.addAttribute("headers", headers);
		model.addAttribute("datas", converMapsList);
		return "excelView";
	}
	
}
