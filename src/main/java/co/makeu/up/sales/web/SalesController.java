package co.makeu.up.sales.web;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.PageVo;
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
		model.addAttribute("ctgrYear", salesDao.salesByCtgrYear());
		model.addAttribute("ctgrMonth", salesDao.salesByCtgrMonth(selectYear==null ? sdf.format(c1.getTime()) : selectYear));
		return "admin/sales/adTSales";
	}
	
	
	// 기간별 - 연도별 ajax
	@GetMapping("/admin/tsales/monthChange")
	@ResponseBody
	public List<SalesVO> monthChange(String selectYear) {
		return salesDao.salesByMonth(selectYear);
	}
	
	//카테고리 기간별 - 연도별 ajax
	@GetMapping("/admin/tsales/ctgrMonthChange")
	@ResponseBody
	public List<SalesVO> ctgrMonthChange(String selectYear){
		return salesDao.salesByCtgrMonth(selectYear);
	}
	
	
	//크리에이터별 통계 이동
	@GetMapping("/admin/adCSales")
	public String adCSales(Model model,SalesVO vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat month = new SimpleDateFormat("MM");
		Calendar c1 = Calendar.getInstance();
		
		List<SalesVO> yearList = salesDao.salesCreator(vo);
		int lengthYear = 0;
		if(yearList.size() != 0) {
			lengthYear = yearList.get(0).getLength();
		}
		
		List<SalesVO> monthList = salesDao.salesCreMonth(vo);
		int lengthMonth = 0;
		if(monthList.size() != 0) {
			lengthMonth = monthList.get(0).getLength();
		}
		
		model.addAttribute("thisyear",sdf.format(c1.getTime()));
		model.addAttribute("thisMonth",month.format(c1.getTime()));
		
		if(vo.getSelectYear() == null) {
			vo.setSelectYear(sdf.format(c1.getTime()));
		}
		if(vo.getMonth() == 0) {
			vo.setMonth(Integer.parseInt(month.format(c1.getTime())));
		}
		
		model.addAttribute("search",vo);
		model.addAttribute("month",vo.getMonth()==0 ? month.format(c1.getTime()) : vo.getMonth() );
		
		model.addAttribute("creYear",yearList);
		model.addAttribute("creMonth",monthList);
		
		model.addAttribute("page",new PageVo(vo,lengthYear, lengthMonth));
		return "admin/sales/adCSales";
	}
	
	//기타 통계 이동
	@GetMapping("/admin/adASales")
	public String adASales(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Calendar c1 = Calendar.getInstance();
		model.addAttribute("thisyear",sdf.format(c1.getTime()));
		
		model.addAttribute("salesGender",salesDao.salesGender(sdf.format(c1.getTime())));
		model.addAttribute("salesAge",salesDao.salesAge(sdf.format(c1.getTime())));
		return "admin/sales/adASales";
	}
	
	//기타통계 - 성별 아작스
	@ResponseBody
	@GetMapping("/admin/adASales/ajaxGender")
	public List<SalesVO> ajaxGender(String selectYear){
		return salesDao.salesGender(selectYear);
	}
	
	//기타통계 -  연령별 아작스
	@ResponseBody
	@GetMapping("/admin/adASales/ajaxAge")
	public List<SalesVO> ajaxAge(String selectYear){
		return salesDao.salesAge(selectYear);
	}

}
