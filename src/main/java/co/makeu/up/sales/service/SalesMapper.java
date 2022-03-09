package co.makeu.up.sales.service;

import java.util.List;

import co.makeu.up.sugang.service.SugangVO;

public interface SalesMapper {
	List<SalesVO> salesByYear();
	List<SalesVO> salesByMonth(String year);
	List<SalesVO> salesByCtgrYear();
	
	// main
	List<SugangVO> lectureTop3();
	List<SugangVO> creatorTop3();
	List<SalesVO> countList();
	List<SalesVO> recent7days();
	List<SalesVO> thisYearSales();
}
