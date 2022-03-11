package co.makeu.up.common.view;

import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.makeu.up.board.service.BoardServiceImpl;
import co.makeu.up.board.service.BoardVO;
import co.makeu.up.creator.service.CreatorServiceImpl;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;
import co.makeu.up.sales.service.SalesService;
import co.makeu.up.sales.service.SalesVO;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;


@Controller
public class ExcelViewController {
	@Autowired SalesService salesDao;
	@Autowired UsersServiceImpl usersDao;
	@Autowired CreatorServiceImpl creatorDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired RefundServiceImpl refundDao;
	@Autowired BoardServiceImpl boardDao;
	
	//매출관리
	@RequestMapping("/admin/yearExcel") //연도별 매출
	public String yearExcel(Model model) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.salesByYear();
		String[] headers = new String[]{"year","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","연도별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("admin/monthExcel")//월별 매출
	public String monthExcel(Model model,@RequestParam("month") String month) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.salesByMonth(month);
		String[] headers = new String[]{"month","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName",month+"년 월별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/admin/yearCtgrExcel")//카테고리 연도별 매출
	public String yearCtgrExcel(Model model) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.salesByCtgrYear();
		String[] headers = new String[]{"year","hc01","hc02","hc03","hc04","hc05","hc06","hc07","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","카테고리별 연도별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/admin/monthCtgrExcel")//카테고리 월별 매출
	public String monthCtgrExcel(Model model,@RequestParam("month") String month) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.salesByCtgrMonth(month);
		String[] headers = new String[]{"month","hc01","hc02","hc03","hc04","hc05","hc06","hc06","hc07","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName",month+"년 카테고리별 월별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/admin/yearCreExcel")//크리에이터 연도별 매출 순위
	public String yearCreExcel(Model model,SalesVO vo) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.creYearExcel(vo);
		String[] headers = new String[]{"rank","id","name","creCnt","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","크리에이터 연도별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}

	@RequestMapping("/admin/monthCreExcel")//크리에이터 월별 매출 순위
	public String monthCreExcel(Model model,SalesVO vo) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.creMonthExcel(vo);
		String[] headers = new String[]{"rank","id","name","creCnt","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","크리에이터 2022년 "+vo.getMonth()+"월별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/admin/genderExcel")
	public String genderExcel(Model model,@RequestParam("year")String year) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.salesGender(year);
		String[] headers = new String[]{"month","woman","man","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","성별 "+year+"년 월별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}

	@RequestMapping("/admin/ageExcel")
	public String ageExcel(Model model,@RequestParam("year")String year) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = salesDao.salesAge(year);
		String[] headers = new String[]{"month","age10","age20","age30","age40","age50","age60","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","연령별 "+year+"년 월별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	//유저관리
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
	
	//크리에이터 관리
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
	
	//강의관리
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

	//공지사항 관리
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

	//환불관리
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
	
	//강의 등록 관리
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
	
	//크리에이터 
	@RequestMapping("/creator/creSaYearExcel")
	public String creSaYearExcel(Model model,Principal pri) throws IllegalArgumentException, IllegalAccessException {
		List<SalesVO> list = creatorDao.creSaYear(pri.getName());
		String[] headers = new String[]{"year","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","연도별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/creator/creSaMonthExcel")
	public String creSaMonthExcel(Model model,@RequestParam("year")String year,Principal pri) throws IllegalArgumentException, IllegalAccessException {
		SalesVO vo = new SalesVO();
		vo.setSelectYear(year);
		vo.setId(pri.getName());
		List<SalesVO> list = creatorDao.creSalesMonth(vo);
		String[] headers = new String[]{"month","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","월별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
	@RequestMapping("/creator/creSaLecExcel")
	public String creSaLecExcel(Model model,@RequestParam("start")String start,@RequestParam("end")String end,Principal pri) throws IllegalArgumentException, IllegalAccessException {
		SalesVO vo = new SalesVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setId(pri.getName());
		List<SalesVO> list = creatorDao.creSaleLec(vo);
		String[] headers = new String[]{"ttl","cnt","pay"};
		List<Map<String,Object>> convertMapsList = CommonExcelView.convertVOtoMaps(list);
		model.addAttribute("fileName","강의별 매출");
		model.addAttribute("headers",headers);
		model.addAttribute("datas", convertMapsList);
		return "excelView";
	}
	
}
