package co.makeu.up.sales.web;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.sales.service.SalesServiceImpl;
import co.makeu.up.sales.service.SalesVO;

@Controller
public class SalesController {
	@Autowired SalesServiceImpl salesDao;

	//기간별 통계이동	
	@GetMapping("/admin/adTSales")
	public String adTSales(Model model,String selectYear) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Calendar c1 = Calendar.getInstance();
		
		model.addAttribute("thisyear",sdf.format(c1.getTime()));
		model.addAttribute("years",salesDao.salesByYear());
		model.addAttribute("months", salesDao.salesByMonth(selectYear==null ? sdf.format(c1.getTime()) : selectYear));
		model.addAttribute("monthsYear", selectYear);
		model.addAttribute("ctgrYear", salesDao.salesByCtgrYear());
		return "admin/sales/adTSales";
	}
	
	// 기간별 - 연도별 ajax
	@GetMapping("/admin/tsales/monthChange")
	@ResponseBody
	public List<SalesVO> monthChange(String selectYear) {
		return salesDao.salesByMonth(selectYear);
	}
	
	
	//크리에이터별 통계 이동
	@GetMapping("/admin/adCSales")
	public String adCSales() {
		return "admin/sales/adCSales";
	}
	
	//기타 통계 이동
	@GetMapping("/admin/adASales")
	public String adASales() {
		return "admin/sales/adASales";
	}

}
