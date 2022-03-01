package co.makeu.up.sales.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalesController {
	
	//기간별 통계이동	
	@GetMapping("/admin/adTSales")
	public String adTSales() {
		return "admin/sales/adTSales";
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
