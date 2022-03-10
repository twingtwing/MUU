package co.makeu.up.common.view;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.refund.service.RefundVO;

@Controller
public class ExcelViewController {
	@Autowired
	RefundServiceImpl refundDao;
	
	@Autowired
	LectureServiceImpl lectureDao;

	/*
	 * @RequestMapping("/excel") public String excel(Model model) {
	 * List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
	 * HashMap<String, Object> map = new HashMap<String, Object>(); // 값들은 나중에 db에서
	 * 가져오면됨 map.put("name", "홍길동"); map.put("sal", "3000"); list.add(map);
	 * model.addAttribute("fileName","empList"); model.addAttribute("headers", new
	 * String[] {"name","sal"}); model.addAttribute("datas", list); return
	 * "excelView"; }
	 */

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
